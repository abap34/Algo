const INF = 10^16

struct UnionFind
    par::Vector{Int}
    size::Vector{Int}
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

function reverse(edge::Edge)
    return Edge(edge.to, edge.from, edge.weight, edge.profit)
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


function add!(graph::Graph, edge::Edge; has_dir=false)
    push!(graph.edges[edge.from], edge)

    if !has_dir
        rev_edge = reverse(edge)
        push!(graph.edges[edge.to], rev_edge)
    end
end


function as_rooted_tree(graph::Graph, root::Int)::Graph
    N = length(graph.edges)

    tree = Graph(N)

    stack = [(root, -1)]

    while !isempty(stack)
        v, p = pop!(stack)
        for u in graph.edges[v]
            if u.to != p
                add!(tree, u, has_dir=true)
                push!(stack, (u.to, v))
            end
        end
    end


    return tree
end

function kruskal(sorted_edges::Vector{Edge}, N)::Tuple{Graph,Int,Int}
    uf = UnionFind(N)

    graph = Graph(N)
    cost = 0
    profit = -1

    for edge in sorted_edges
        if !issame!(uf, edge.from, edge.to)
            unite!(uf, edge.from, edge.to)
            add!(graph, edge)
            cost += edge.weight
            profit = max(profit, edge.profit)
        end
    end

    return graph, cost, profit
end


struct LCA
    parent::Vector{Vector{Int}}
    dist::Vector{Vector{Int}}
    depth::Vector{Int}
    K::Int
    V::Int
    function LCA(graph::Graph; root=1)
        V = length(graph.edges)
        K = ceil(Int, log2(V))

        tree = as_rooted_tree(graph, root)

        parent = [fill(-1, V) for _ in 1:K]
        dist = [fill(-1, V) for _ in 1:K]
        depth = fill(-1, V)

        stack = [(root, -1, 0)]

        while !isempty(stack)
            v, p, d = pop!(stack)
            depth[v] = d
            parent[1][v] = p
            for u in tree.edges[v]
                if u.to != p
                    dist[1][u.to] = u.weight
                    push!(stack, (u.to, v, d + 1))
                end
            end
        end


        for k in 1:K-1
            for v in 1:V
                if parent[k][v] == -1
                    continue
                else
                    parent[k+1][v] = parent[k][parent[k][v]]
                    dist[k+1][v] = max(dist[k][v], dist[k][parent[k][v]])
                end
            end
        end

        return new(parent, dist, depth, K, V)
    end
end

function max_cost(lca::LCA, u::Int, v::Int)::Int
    cost = -INF

    if lca.depth[u] < lca.depth[v]
        u, v = v, u
    end

    diff = lca.depth[u] - lca.depth[v]

    for k in 0:lca.K-1
        if (diff >> k) & 1 == 1
            cost = max(cost, lca.dist[k+1][u])
            u = lca.parent[k+1][u]
        end
    end

    if u == v
        return cost
    end


    for k in lca.K:-1:1
        if lca.parent[k][u] != lca.parent[k][v]
            cost = max(cost, lca.dist[k][u])
            cost = max(cost, lca.dist[k][v])

            u = lca.parent[k][u]
            v = lca.parent[k][v]
        end
    end

    cost = max(cost, lca.dist[1][u])
    cost = max(cost, lca.dist[1][v])
    return cost
end




function main()
    N, K, C = parse.(Int, split(readline()))
    graph = Graph(N)

    for i in 1:K
        u, v, w, p = parse.(Int, split(readline()))
        edge = Edge(u, v, w, p)
        add!(graph, edge)
    end

    sorted_edges = all_edges(graph)
    sort!(sorted_edges, by=(x -> x.weight), rev=false)

    mst, C_m, P_m = kruskal(sorted_edges, N)

    mst_edges_set = Set{Edge}(all_edges(mst))

    mst_tree = as_rooted_tree(mst, 1)

    lca = LCA(mst_tree)

    sort!(sorted_edges, by=(x -> x.profit), rev=true)

    i = 0
    for edge in sorted_edges
        i += 1
        P = edge.profit
        if (edge in mst_edges_set)
            C_add = 0
            C_rem = 0
        else
            u, v, C_add = edge.from, edge.to, edge.weight
            C_rem = max_cost(lca, u, v)
        end

        if C_m + C_add - C_rem <= C
            println(P)
            return
        end
    end

    println(-1)
end


main()