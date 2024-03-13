struct UnionFind
    par::Array{Int,1}
    size::Array{Int,1}
    UnionFind(N) = new(collect(1:N), collect(1:N))
end

function root!(uf::UnionFind, x::Int)
    if uf.par[x] == x
        return x
    else
        return uf.par[x] = root!(uf, uf.par[x])
    end
end


function issame!(uf::UnionFind, x::Int, y::Int)
    return root!(uf, x) == root!(uf, y)
end

function unite!(uf::UnionFind, x::Int, y::Int)
    x = root!(uf, x)
    y = root!(uf, y)
    (x == y) && (return true)
    if (uf.size[x] < uf.size[y])
        uf.par[x] = y
        uf.size[y] += uf.size[x]
    else
        uf.par[y] = x
        uf.size[x] += uf.size[y]
    end
    return true
end


struct Edge
    from::Int
    to::Int
    weight::Int
    profit::Int
end

struct Graph
    edges::Vector{Vector{Edge}}
    function Graph(N)
        edges = [Vector{Edge}() for _ in 1:N]
        new(edges)
    end
end

function all_edges(graph::Graph)::Vector{Edge}
    return collect(Iterators.flatten(graph.edges))
end

# u <-> v の間の辺を縮約
function contract(graph::Graph, u::Int, v::Int)::Graph
    if u > v
        u, v = v, u
    end

    contracted_graph = Graph(length(graph.edges))
    for edge in all_edges(graph)
        if (edge.from == u && edge.to == v) || (edge.from == v && edge.to == u)
            continue
        end

        if edge.from == v
            add!(contracted_graph, u, edge.to, edge.weight, edge.profit)
        elseif edge.to == v
            add!(contracted_graph, edge.from, u, edge.weight, edge.profit)
        else
            add!(contracted_graph, edge.from, edge.to, edge.weight, edge.profit)
        end
    end

    check_valid(contracted_graph)

    return contracted_graph
end


function plot_graphviz(graph::Graph)
    println("strict graph G {")
    println("  splines=false")
    println("  rankdir=LR")
    for (i, edges) in enumerate(graph.edges)
        for edge in edges
            println("$(i) -- $(edge.to) [label=\"w, p: $(edge.weight), $(edge.profit)\"]")
        end
    end
    println("}")
end

function add!(graph::Graph, from::Int, to::Int, weight::Int, profit::Int; dir=false)
    edge = Edge(from, to, weight, profit)
    add!(graph, edge, dir=dir)
end

function add!(graph::Graph, edge::Edge; dir=false)
    push!(graph.edges[edge.from], edge)
    if !dir
        rev_edge = Edge(edge.to, edge.from, edge.weight, edge.profit)
        add!(graph, rev_edge, dir=true)
    end
end

# グラフが壊れてないかチェック
function check_valid(graph::Graph)
    for (i, edges) in enumerate(graph.edges)
        for edge in edges
            if edge.from != i
                @show edge
                @show i
                throw("invalid graph")
            end
        end
    end
end

# クラスカル法で最小全域木を求めてそれとコストを返す
function kruskal(graph::Graph; by=identity)::Tuple{Graph,Int,Int}
    N = length(graph.edges)

    edges = sort(all_edges(graph), by=by)

    uf = UnionFind(length(graph.edges))

    graph = Graph(N)
    cost = 0
    profit = -1

    for edge in edges
        if !issame!(uf, edge.from, edge.to)
            unite!(uf, edge.from, edge.to)
            add!(graph, edge)
            cost += edge.weight
            profit = max(profit, edge.profit)
            check_valid(graph)
        end
    end

    return graph, cost, profit
end




function main()
    N, K, C = parse.(Int, split(readline()))
    graph = Graph(N)
    for _ in 1:K
        u, v, w, p = parse.(Int, split(readline()))
        add!(graph, u, v, w, p)
    end

    cand_edges = all_edges(graph)

    sort!(cand_edges, by=(x -> x.profit), rev=true)

    result = Tuple{Int,Int}[]

    for edge in cand_edges
        contracted_graph = contract(graph, edge.from, edge.to)

        _, _C, _ = kruskal(contracted_graph, by=(x -> x.weight))

        _C += edge.weight

        P = edge.profit

        push!(result, (_C, P))
    end




    sort!(result, by=(x -> x[2]), rev=true)

    for (_C, P) in result
        if _C <= C
            println(P)
            return
        end
    end

    println(-1)


end

main()