function main()
    N, M = parse.(Int, split(readline()))

    G = [Set{Int}() for i in 1:N]

    for i in 1:M
        a, b = parse.(Int, split(readline()))
        push!(G[a], b)
        push!(G[b], a)
    end

    visited = [false for i in 1:N]
    visited_edge = Set{Tuple{Int, Int}}()

    function dfs(v)
        visited[v] = true
        size = 1
        edge = 0
        for u in G[v]
            if visited[u]
                if (v, u) in visited_edge || (u, v) in visited_edge
                    continue
                end
                visited_edge = push!(visited_edge, (v, u))
                edge += 1
            else
                s, e = dfs(u)
                size += s
                edge += e
            end
        end
        return size, edge
    end


    ans = 0

    for i in 1:N
        if visited[i]
            continue
        end
        size, edge = dfs(i)
        ans += div((size * (size - 1)), 2) - edge    
    end

    println(ans)




end

main()