function field_to_graph(field, H, W)
    G = Matrix{Set{Tuple{Int,Int}}}(undef, H, W)

    for i in 1:H
        for j in 1:W
            G[i, j] = Set{Tuple{Int,Int}}()

            # 自分が壁なら何もしない
            if field[i, j]
                continue
            end

            if i > 1 && !field[i-1, j]
                push!(G[i, j], (i - 1, j))
            end

            if i < H && !field[i+1, j]
                push!(G[i, j], (i + 1, j))
            end

            if j > 1 && !field[i, j-1]
                push!(G[i, j], (i, j - 1))
            end

            if j < W && !field[i, j+1]
                push!(G[i, j], (i, j + 1))
            end
        end
    end

    return G
end


function count_group_size(B, group, H, W)
    group_set = Set(group)
    for (i, j) in group
        if B[i, j]
            continue
        end

        if i > 1 && B[i-1, j]
            push!(group_set, (i - 1, j))
        end

        if i < H && B[i+1, j]
            push!(group_set, (i + 1, j))
        end

        if j > 1 && B[i, j-1]
            push!(group_set, (i, j - 1))
        end


        if j < W && B[i, j+1]
            push!(group_set, (i, j + 1))
        end
    end

    return length(group_set)
end


function main()
    H, W = parse.(Int, split(readline()))
    A = Matrix{Bool}(undef, H, W)

    for i in 1:H
        A[i, :] = [c == '#' for c in readline()]
    end

    B = fill(false, (H, W))

    # 上下左右が '#' かどうか
    for i in 1:H
        for j in 1:W
            if A[i, j] == true
                B[i, j] = true
            else
                if i > 1 && A[i-1, j] == true
                    B[i, j] = true
                elseif i < H && A[i+1, j] == true
                    B[i, j] = true
                elseif j > 1 && A[i, j-1] == true
                    B[i, j] = true
                elseif j < W && A[i, j+1] == true
                    B[i, j] = true
                end
            end
        end
    end

    A = nothing

    G = field_to_graph(B, H, W)

    visited = fill(false, (H, W))
    stack = Tuple{Int,Int}[]

    function dfs(i, j, group)
        push!(stack, (i, j))

        while !isempty(stack)
            (i, j) = pop!(stack)

            if visited[i, j]
                continue
            end

            visited[i, j] = true
            push!(group, (i, j))

            for (ni, nj) in G[i, j]
                push!(stack, (ni, nj))
            end
        end
    end


    max_size = 1

    for i in 1:H
        for j in 1:W
            if B[i, j]
                continue
            end

            if visited[i, j]
                continue
            end

            group = Tuple{Int,Int}[]

            dfs(i, j, group)

            count = count_group_size(B, group, H, W)

            max_size = max(max_size, count)
        end
    end

    println(max_size)


end

main()