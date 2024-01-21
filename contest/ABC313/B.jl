function main()
    N, M = parse.(Int, split(readline()))
    D = Dict{Int, Vector{Int}}()
    for _ in 1:M
        a, b = parse.(Int, split(readline()))
        if haskey(D, a)
            push!(D[a], b)
        else
            D[a] = [b, ]
        end
    end
    ok_matrix = fill(false, (N, N))
    for strong in 1:N
        seen_set = Set{Int}()
        ok_table = fill(false, N)
        ok_table[strong] = true
        ok_table = dfs(strong, D, ok_table, seen_set)
        ok_matrix[strong, :] .= ok_table
    end


    for i in 1:N
        if all(ok_matrix[i, :] .== 1)
            println(i)
            return
        end
    end

    println(-1)
    return
end


function dfs(people, D, ok_table, seen_set)
    if people in seen_set
        return ok_table
    end
    
    push!(seen_set, people)
    if !(haskey(D, people))
        return ok_table
    end

    for lose in D[people]
        ok_table[lose] = true
        ok_table = dfs(lose, D, ok_table, seen_set)
    end
    return ok_table
end


main()

