import Base
using DataStructures

# adjancency_dict[v]: 頂点vに隣接する頂点のリスト または Set
# edges: 辺のリスト
# dir: 有向グラフかどうか
struct Graph{C<:Union{Vector{Int},Set{Int}}}
    vertices::Set{Int}
    adjancency_dict::DefaultDict{Int,C}
    edges::Vector{Tuple{Int,Int}}
    dir::Bool
end

struct GraphConstructor
   v_to_idx::Dict{Int,Int}
   adjancy_list::Vector{Vector{Int}}
   edges::Vector{Tuple{Int,Int}}
   dir::Bool
   waiting_edges::Vector{Tuple{Int,Int}}
end




function Graph(N::Int; container::Type=Vector{Int}, dir::Bool=false)
    vertices = Set(1:N)
    adjancency_dict = DefaultDict{Int,container}(container)
    edges = Vector{Tuple{Int,Int}}()
    return Graph{container}(vertices, adjancency_dict, edges, dir)
end

function Graph(; dir::Bool=false)
    return Graph{Vector{Int}}(Set{Int}(), DefaultDict{Int,Vector{Int}}(Vector{Int}), Vector{Tuple{Int,Int}}(), dir)
end

function Graph(N::Int, edges::Vector{Tuple{Int,Int}}; dir::Bool=false)
    g = Graph(N, dir=dir)
    add_edges!(g, edges)
    return g
end

function Base.show(io::IO, graph::Graph)
    println(io, "Graph($(vertex_count(graph)), $(edge_count(graph)))")
    for (from, to) in graph.edges
        println(io, "  $from -> $to")
    end
end

function graphviz(graph::Graph)
    println("digraph G {")
    for (from, to) in graph.edges
        println("  $from -> $to;")
    end
    println("}")
end

function graphviz(graphs::Vector{Graph})
    println("digraph G {")
    for g in graphs
        println("  subgraph cluster$(g.id) {")
        for (from, to) in g.edges
            println("    $from -> $to;")
        end
        println("  }")
    end
    println("}")
end


function vertex_count(graph::Graph)
    return length(graph.vertices)
end


function edge_count(graph::Graph)
    return length(graph.edges)
end



function add_edge!(graph::Graph, from::Int, to::Int; add_vertex::Bool=true)
    if add_vertex
        push!(graph.vertices, from)
        push!(graph.vertices, to)
    end

    push!(graph.adjancency_dict[from], to)

    if !graph.dir
        push!(graph.adjancency_dict[to], from)

        if from > to
            from, to = to, from
        end
    end

    push!(graph.edges, (from, to))
end

function add_edges!(graph::Graph, edges::Vector{Tuple{Int,Int}})
    for (from, to) in edges
        add_edge!(graph, from, to)
    end
end

# 強連結成分分解
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


main()