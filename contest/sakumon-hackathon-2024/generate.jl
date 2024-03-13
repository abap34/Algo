using DataStructures
using Random
using Distributions

using Printf

DEBUG = false
MAX_N = 10^5
MAX_K = 10^5
MAX_C = 10^10
MAX_W = 10^5
MAX_P = 10^5



Random.seed!(34)


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
    # from, to が被ってたらスルーする用
    fromtoset::Vector{Set{Tuple{Int,Int}}}
    function Graph(N)
        edges = [Vector{Edge}() for _ in 1:N]
        fromtoset = [Set{Tuple{Int,Int}}() for _ in 1:N]
        new(edges, fromtoset)
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



function all_edges(graph::Graph)::Vector{Edge}
    return collect(Iterators.flatten(graph.edges))
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

function check_valid(graph::Graph)
    for (i, edges) in enumerate(graph.edges)
        for edge in edges
            if edge.from != i
                throw("invalid graph: $(edge) in $(i)")
            end
        end
    end
end

function is_connected(graph::Graph)
    N = length(graph.edges)
    K = sum(length(edges) for edges in graph.edges)
    @assert N <= K + 1
    @assert K <= MAX_K

    visited = falses(N)
    st = Stack{Int}()
    push!(st, 1)

    while !isempty(st)
        u = pop!(st)
        visited[u] = true
        for edge in graph.edges[u]
            v = edge.to
            if !visited[v]
                push!(st, v)
            end
        end
    end


    return all(visited)
end

function print_case(N::Int, K::Int, C::Int, graph::Graph, out::Function; shuffle=true)
    @assert 1 <= N <= MAX_N
    @assert 1 <= K <= MAX_K
    @assert 1 <= C <= MAX_C

    @assert N == length(graph.edges)
    @assert K == sum(length(edges) for edges in graph.edges)
    @assert is_connected(graph)

    out("$N $K $C")

    # 辺を relabel
    shuffle_table = collect(1:N)
    shuffle!(shuffle_table)
    if !shuffle
        shuffle_table = collect(1:N)
    end

    outs = String[]
    for u in 1:N
        for edge in graph.edges[u]
            v = edge.to
            w = edge.weight
            p = edge.profit
            @assert 1 <= w <= MAX_W
            @assert 1 <= p <= MAX_P
            o = @sprintf("%d %d %d %d", shuffle_table[u], shuffle_table[v], w, p)
            push!(outs, o)
        end
    end

    # 適当に出力順もシャッフル
    priority = rand(length(outs))
    for i in sortperm(priority)
        out(outs[i])
    end
end


function add!(graph::Graph, edge::Edge; has_dir=false)
    from, to = edge.from, edge.to

    if (from, to) in graph.fromtoset[from]
        return
    end

    push!(graph.fromtoset[from], (from, to))

    push!(graph.edges[edge.from], edge)

    if !has_dir
        rev_edge = reverse(edge)
        if (rev_edge.to, rev_edge.from) in graph.fromtoset[rev_edge.to]
            return
        end

        push!(graph.fromtoset[rev_edge.to], (rev_edge.to, rev_edge.from))


        push!(graph.edges[edge.to], rev_edge)
    end

    if DEBUG
        check_valid(graph)
    end
end


# 1 ~ N までつながったグラフを作る
function line_graph(N; weight_range=1:10^5, profit_range=1:10^5)
    graph = Graph(N)
    for i in 1:N-1
        w = rand(weight_range)
        p = rand(profit_range)
        add!(graph, Edge(i, i + 1, w, p), has_dir=true)
    end
    return graph
end


function gen_N(dist::Distribution=Uniform(0, 1))
    return ceil(Int, rand(dist) * MAX_N)
end


gen_K(N) = min(rand(N-1:(N*(N-1))÷2), MAX_K - N - 1)


# コストの最小全域にちょい足し
function not_top(out::Function)
    N = gen_N()
    K = gen_K(N)

    graph = line_graph(N)

    for _ in N:K
        u = rand(1:N-1)
        v = rand(u+1:N)

        w = rand(1:MAX_W)

        # p = ceil(Int, w * (0.5 + (rand() - 0.5) / 1.2))


        p = rand(1:MAX_P)


        add!(graph, Edge(u, v, w, p), has_dir=true)
    end

    _, C, _ = kruskal(graph, by=edge -> edge.weight)

    C = ceil(Int, C) + 10

    # かぶって辺が消える可能性があるので K を再計算
    K = sum(length(edges) for edges in graph.edges)

    print_case(N, K, C, graph, out)
end

# それぞれのコストが小さいケース(そのままの全域木が答えになるもの.)
function gen_small_cost(out::Function)
    N = gen_N()
    K = gen_K(N)

    C = rand(1:MAX_C)

    graph = line_graph(N, weight_range=1:10, profit_range=1:10)

    for _ in N:K
        u = rand(1:N-1)
        v = rand(u+1:N)

        w = rand(1:MAX_W)
        p = rand(1:10)

        add!(graph, Edge(u, v, w, p), has_dir=true)
    end

    K = sum(length(edges) for edges in graph.edges)

    print_case(N, K, C, graph, out)
end

# 全体コストが小さいケース. -1 になる
function gen_small_total_cost(out::Function)
    N = gen_N()
    K = gen_K(N)

    C = rand(1:10)

    graph = line_graph(N)

    for _ in N:K
        u = rand(1:N-1)
        v = rand(u+1:N)

        w = rand(1:10^5)
        p = rand(1:10^5)

        add!(graph, Edge(u, v, w, p), has_dir=true)
    end

    K = sum(length(edges) for edges in graph.edges)

    print_case(N, K, C, graph, out)
end


# 完全グラフ
function gen_dense(out::Function)
    # N(N - 1) / 2 <= 10^5
    limN = 447
    N = rand(limN-10:limN)
    K = N * (N - 1) ÷ 2

    graph = Graph(N)

    for u in 1:N
        for v in u+1:N
            w = rand(1:MAX_W)
            p = rand(1:MAX_P)
            add!(graph, Edge(u, v, w, p), has_dir=true)
        end
    end

    _, C, _ = kruskal(graph, by=edge -> edge.weight)

    C = ceil(Int, C) + 3

    print_case(N, K, C, graph, out)
end


# 閉路クソデカチャンネル(ぐるっと回る感じ)
function gen_cycle(out::Function)
    N = MAX_N
    K = N
    C = rand(MAX_C-1000:MAX_C)

    avg = C ÷ K

    graph = line_graph(N, weight_range=avg-10:avg, profit_range=avg-10:avg)

    add!(graph, Edge(1, N, rand(avg-10:avg), rand(avg-10:avg)), has_dir=true)

    K = sum(length(edges) for edges in graph.edges)

    @assert K == N

    print_case(N, K, C, graph, out)
end



# 直線グラフ
function gen_line(out::Function)
    N = MAX_N
    K = N - 1
    C = rand(MAX_C÷1000:MAX_C)

    graph = line_graph(N)

    print_case(N, K, C, graph, out)
end




CASE_COUTNS = Dict{Function,Int}(
    # not_top => 10,
    # gen_small_cost => 4,
    # gen_small_total_cost => 2,
    # gen_dense => 10,
    # gen_line => 1,
    gen_cycle => 5,
)

function main()
    for (gen, count) in CASE_COUTNS
        for i in 1:count
            filename = "in/$(gen)_$(i).in"
            @info "generate $(filename)"
            open(filename, "w") do f
                gen(s -> println(f, s))
            end
        end
    end
end


main()
