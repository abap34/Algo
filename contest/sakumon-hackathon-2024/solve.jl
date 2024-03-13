const INF = 10000000000

const DEBUG = false

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

function plot_graphviz(graph::Graph)
    println("strict graph G {")
    println("  splines=false")
    println("  rankdir=LR")
    for (i, edges) in enumerate(graph.edges)
        for edge in edges
            println("   $(i) -- $(edge.to) [label=\"w, p: $(edge.weight), $(edge.profit)\"]")
        end
    end
    println("}")
end


# グラフが壊れてないかチェック
function check_valid(graph::Graph)
    for (i, edges) in enumerate(graph.edges)
        for edge in edges
            if edge.from != i
                throw("invalid graph: $(edge) in $(i)")
            end
        end
    end
end


function add!(graph::Graph, edge::Edge; has_dir=false)
    push!(graph.edges[edge.from], edge)

    if !has_dir
        rev_edge = reverse(edge)
        push!(graph.edges[edge.to], rev_edge)
    end

    if DEBUG
        check_valid(graph)
    end
end


function as_rooted_tree(graph::Graph, root::Int)::Graph
    N = length(graph.edges)

    tree = Graph(N)

    function dfs(v, p)
        for u in graph.edges[v]
            if u.to != p
                add!(tree, u, has_dir=true)
                dfs(u.to, v)
            end
        end
    end

    dfs(root, -1)

    return tree
end

# クラスカル法で最小全域木を求める.　O(E log V)
# Input: Grpah
# Output: Graph, cost, profit
function kruskal(graph::Graph; by=identity, rev=false)::Tuple{Graph,Int,Int}
    N = length(graph.edges)

    edges = sort(all_edges(graph), by=by, rev=rev)

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
        end
    end

    return graph, cost, profit
end


struct LCA
    parent::Vector{Vector{Int}}  # parent[k][u] := u の 2^(k-1) 先の親
    dist::Vector{Vector{Int}}  # dist[k][u] := 頂点 u から 2^(k-1) 個先の親ノードまでの辺のうちコストが最大のもののコスト
    depth::Vector{Int}
    K::Int
    V::Int
    function LCA(graph::Graph; root=1)
        V = length(graph.edges)

        @assert 1 <= root <= V

        K = ceil(Int, log2(V))

        tree = as_rooted_tree(graph, root)

        parent = [fill(-1, V) for _ in 1:K]
        dist = [fill(-1, V) for _ in 1:K]
        depth = fill(-1, V)

        function dfs(v, p, d)
            depth[v] = d
            parent[1][v] = p
            for u in tree.edges[v]
                if u.to != p
                    # 一個先の最短はその辺
                    debug("$(u.to) の 1 先の親までの max cost: $(u.weight)")
                    dist[1][u.to] = u.weight
                    dfs(u.to, v, d + 1)
                end
            end
        end

        dfs(root, -1, 0)

        debug("---- dfs end ----")

        for k in 1:K-1
            for v in 1:V
                if parent[k][v] == -1
                    continue
                else
                    parent[k+1][v] = parent[k][parent[k][v]]
                    dist[k+1][v] = max(dist[k][v], dist[k][parent[k][v]])
                    debug("$(v) の $(2^(k+1-1)) 先の親までの max cost: $(dist[k+1][v])")
                end
            end
        end

        return new(parent, dist, depth, K, V)
    end
end

# u と v を繋いでできる閉路の中で最大のコストを返す
# O(log V)
function max_cost(lca::LCA, u::Int, v::Int)::Int
    @assert u > 0
    @assert v > 0

    cost = -INF


    # u の方が深くする
    if lca.depth[u] < lca.depth[v]
        u, v = v, u
    end


    debug("$u の深さ: ", lca.depth[u])
    debug("$v の深さ: ", lca.depth[v])


    diff = lca.depth[u] - lca.depth[v]

    debug("diff: ", diff)

    # u と v の深さを揃えるように上げてく　cost 更新わすれず
    for k in 0:lca.K-1
        if (diff >> k) & 1 == 1
            cost = max(cost, lca.dist[k+1][u])
            u = lca.parent[k+1][u]
        end
    end

    if u == v
        debug("u == v return cost: ", cost)
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
    for _ in 1:K
        u, v, w, p = parse.(Int, split(readline()))
        edge = Edge(u, v, w, p)
        add!(graph, edge)
    end

    mst, C_m, P_m = kruskal(graph, by=(x -> x.weight))

    # plot_graphviz(mst)

    mst_edges_set = Set{Edge}(all_edges(mst))

    mst_tree = as_rooted_tree(mst, 1)

    debug("mst_tree: ", mst_tree.edges)

    # plot_graphviz(mst_tree)

    lca = LCA(mst_tree)

    cand_edges = all_edges(graph)

    sort!(cand_edges, by=(x -> x.profit), rev=true)

    result = Tuple{Int,Int}[]

    # plot_graphviz(graph)

    for edge in cand_edges
        debug("==========")
        debug("try to insert: ", edge)

        P = edge.profit
        if (edge in mst_edges_set)
            debug("already in mst")
            C_add = 0
            C_rem = 0
        else
            u, v, C_add = edge.from, edge.to, edge.weight
            C_rem = max_cost(lca, u, v)
            debug("max cost between ", u, " and ", v, " is ", C_rem)
        end

        if C_m + C_add - C_rem <= C
            debug("add edge: ", edge)
            debug("remove edge C= ", C_rem)
            println(P)
            return
        else
            debug("cost is over!!!!!")
        end

        push!(result, (C_m + C_add - C_rem, P))
    end

    # @show result

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