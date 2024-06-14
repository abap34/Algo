include("graph.jl")

# 閉路検出
# input: グラフ
# output: 閉路が存在する場合は閉路のリストをひとつ返し、存在しない場合は空リストを返す
function cycle(graph::Graph)
    N = vertex_count(graph)
    visited = zeros(Bool, N)
    stack = []
    path = []
    cycle = []
    found = false

    function dfs(v::Int, g::Graph)
        visited[v] = true
        push!(stack, v)
        push!(path, v)
        for to in g.adjancency_dict[v]
            if !visited[to]
                dfs(to, g)
            elseif to == path[1]
                found = true
                cycle = copy(path)
            end
        end
        pop!(path)
        pop!(stack)
    end

    for v in 1:N
        if !visited[v]
            dfs(v, graph)
            if found
                break
            end
        end
    end

    return cycle
end


