const INF = 10^16

DEBUG = false
function debug(args...)
    if DEBUG
        println(args...)
    end
end

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
end

function reverse(edge::Edge)
    return Edge(edge.to, edge.from, edge.weight)
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

function kruskal(sorted_edges::Vector{Edge}, N)::Tuple{Graph,Int}
    uf = UnionFind(N)

    graph = Graph(N)
    cost = 0
    for edge in sorted_edges
        if !issame!(uf, edge.from, edge.to)
            unite!(uf, edge.from, edge.to)
            add!(graph, edge)
            cost += edge.weight
        end
    end

    return graph, cost
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
                    dist[k+1][v] = min(dist[k][v], dist[k][parent[k][v]])
                end
            end
        end

        return new(parent, dist, depth, K, V)
    end
end


function max_cost(lca::LCA, u::Int, v::Int)::Int
    cost = INF

    if lca.depth[u] < lca.depth[v]
        u, v = v, u
    end

    diff = lca.depth[u] - lca.depth[v]

    for k in 0:lca.K-1
        if (diff >> k) & 1 == 1
            cost = min(cost, lca.dist[k+1][u])
            u = lca.parent[k+1][u]
        end
    end

    if u == v
        return cost
    end


    for k in lca.K:-1:1
        if lca.parent[k][u] != lca.parent[k][v]
            cost = min(cost, lca.dist[k][u])
            cost = min(cost, lca.dist[k][v])

            u = lca.parent[k][u]
            v = lca.parent[k][v]
        end
    end

    cost = min(cost, lca.dist[1][u])
    cost = min(cost, lca.dist[1][v])
    return cost
end

function add_edge!(lca::LCA, edge::Edge)
    u, v, w = edge.from, edge.to, edge.weight

    if lca.depth[u] < lca.depth[v]
        u, v = v, u
    end


    for k in 0:lca.K-1
        if u == -1
            lca.dist[k+1][u] = min(lca.dist[k+1][u], w)
            break
        end

        if v == -1
            lca.dist[k+1][v] = min(lca.dist[k+1][v], w)
            break
        end

        if (lca.depth[u] - lca.depth[v] >> k) & 1 == 1
            lca.dist[k+1][u] = min(lca.dist[k+1][u], w)
            u = lca.parent[k+1][u]
        end
    end
end



function main()
    N, Q = parse.(Int, split(readline()))
    query = Tuple{Int,Int,Int}[]

    graph = Graph(N)

    for _ in 1:N
        u, v, w = parse.(Int, split(readline()))
        edge = Edge(u, v, w)
        add!(graph, edge)
    end

    for _ in 1:Q-1
        u, v, w = parse.(Int, split(readline()))
        push!(query, (u, v, w))
    end

    sorted_edges = all_edges(graph)
    sort!(sorted_edges, by=(x -> x.weight), rev=false)

    mst, C_m = kruskal(sorted_edges, N)

    mst_edges_set = Set{Edge}(all_edges(mst))

    mst_tree = as_rooted_tree(mst, 1)

    lca = LCA(mst_tree)

    println(
        C_m
    )

    println("================")
    for (u, v, w) in query
       
        println("add: $u -> $v, $w")
       
        cost = max_cost(lca, u, v)

        # debug(C_m + w - cost)
        @show C_m
        @show w
        @show cost
        
        C_m = min(
            C_m,
            C_m - cost + w

        )
        println(C_m)
        
        add_edge!(lca, Edge(u, v, w))

        println("================")
    end
end


main()