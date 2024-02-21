struct Edge
    from::Int
    to::Int
    weight::Int
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