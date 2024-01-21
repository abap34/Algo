function main()
    N, S, T = parse.(Int, split(readline()))
    
    edges_list = Vector{Int}[]
    
    for _ in 1:N
        push!(edges_list, Int[])
    end


    for _ in 1:N-1
        u, v = parse.(Int, split(readline()))
        push!(edges_list[u], v)
        push!(edges_list[v], u)
    end


    answers = zeros(Int, N)
    path = []

    for node in edges_list[S]
        prev = fill(-1, N)
        prev[node] = S
        
        seen_set = Set{Int}()
        push!(seen_set, S)
        push!(seen_set, node)

        ok = dfs(node, edges_list, prev, seen_set, T)
        if ok
            v = T
            while prev[v] != -1 
                push!(path, v)
                v = prev[v]
            end

            push!(path, S)

            for v in path
                push!(seen_set, v)
                answers[v] = 1
            end 
            break
        end
    end

    path_set = Set(path)

    seen_set = copy(path_set)


    for n in path
        answers[n] = 1
        dfs2(n, edges_list, seen_set, path_set, answers)    
    end


    for ans in answers
        println(ans)
    end
end



function dfs(node, edges_list, prev, seen_set, target_node)
    if node == target_node
        return true
    end

    next_nodes = edges_list[node]

    for next_node in next_nodes
        if next_node in seen_set
            continue
        end

        push!(seen_set, next_node)

        prev[next_node] = node
        result = dfs(next_node, edges_list, prev, seen_set, target_node)
        

        if result
            return true
        end
    end

    return false

end



function dfs2(node, edges_list, seen_set, path_set, answers)
    next_nodes = edges_list[node]

    for next_node in next_nodes
        if (next_node in seen_set) || (next_node in path_set)
            continue
        end

        push!(seen_set, next_node)
        answers[next_node] = answers[node] + 1

        dfs2(next_node, edges_list, seen_set, path_set, answers)
    end
    return false
end


main()