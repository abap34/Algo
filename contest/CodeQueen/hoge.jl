function main()
    N, S, T = parse.(Int, split(readline()))
    
    edges = fill(false, (N, N))
    edges_list = Vector{Int}[]
    
    for _ in 1:N
        push!(edges_list, Int[])
    end

    for _ in 1:N-1
        u, v = parse.(Int, split(readline()))
        if v == S
            u, v = v, u
        end
        edges[u, v] = true
        push!(edges_list[u], v)
    end

    answers = zeros(Int, N)
    seen_set = Set{Int}()
    path = [T, ]

    for node in edges_list[S]
        prev = fill(-1, N)
        prev[node] = S
        ok = dfs(node, edges, edges_list, prev, T)
        if ok
            v = T
            while prev[v] != -1 
                push!(path, prev[v])
                v = prev[v]
            end
            for v in path
                push!(seen_set, v)
                answers[v] = 1
            end 
            break
        
        end
    end


    for v in path
        dfs2(v, edges, seen_set, edges_list, answers)
    end 

    for ans in answers
        println(ans)
    end
end


function dfs(node, edges, edges_list, prev, target_node)
    if node == target_node
        return true
    end

    if isempty(edges_list[node])
        return false
    end

    for next_node in edges_list[node]
        prev[next_node] = node
        ok = dfs(next_node, edges, edges_list, prev, target_node)
        (ok) && (return true)
    end

    return false
end


function dfs2(node, edges, seen_set, edges_list, answers)
    next_nodes = edges_list[node]
    for next_node in next_nodes
        if !(next_node in seen_set)
            answers[next_node] = answers[node] + 1
        end
        push!(seen_set, next_node)
        dfs2(next_node, edges, seen_set, edges_list, answers)
    end
end


main()