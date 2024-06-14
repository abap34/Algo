include("graph.jl")

# 強連結成分分解
# input: グラフ
# output: 強連結成分のリスト
function scc(graph::Graph)
    N = vertex_count(graph)
    graphs = Vector{Graph}()
    visited = zeros(Bool, N)
    visited_edges = Set{Tuple{Int,Int}}()

    function dfs(v::Int, g::Graph, subgraph::Graph)
        visited[v] = true
        stack = [v]
        while !isempty(stack)
            from = pop!(stack)
            for to in g.adjancency_dict[from]
                if (from, to) ∉ visited_edges && (to, from) ∉ visited_edges
                    add_edge!(subgraph, from, to, add_vertex=true)

                    push!(stack, to)
                    push!(visited_edges, (from, to))
                    push!(visited_edges, (to, from))
                    visited[to] = true
                end
            end
        end
    end

    for v in 1:N
        if !visited[v]
            subgraph = Graph(dir=graph.dir)
            dfs(v, graph, subgraph)
            if vertex_count(subgraph) > 0
                push!(graphs, subgraph)
            end
        end
    end

    return graphs
end

# ABC-350-D
function main()
    N, M = parse.(Int, split(readline()))
    G = Graph(N, container=Set{Int64}, dir=false)

    for _ in 1:M
        a, b = parse.(Int, split(readline()))
        add_edge!(G, a, b)
    end

    sccs = scc(G)

    ans = sum(
        g -> (vertex_count(g) * (vertex_count(g) - 1)) ÷ 2 - edge_count(g),
        sccs,
        init=0
    )

    println(ans)
end

if abspath(PROGRAM_FILE) == @__FILE__
    main()
end