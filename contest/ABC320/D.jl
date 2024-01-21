function main()
    N, M = parse.(Int, split(readline()))
    UNDEF = -10000000000
    G = [Int[] for _ in 1:N]
    D = Dict{Tuple{Int, Int}, Tuple{Int, Int}}()
    C = fill((UNDEF, UNDEF), N)
    C[1] = (0, 0)
    for _ in 1:M
        a, b, x, y = parse.(Int, split(readline()))
        push!(G[a], b)
        push!(G[b], a)
        D[(a, b)] = (x, y)
        D[(b, a)] = (-x, -y)
    end


    seen_set = Set{Int}()
    push!(seen_set, 1)

    dfs!(1, G, seen_set, C, D)

    for i in 1:N
        x, y = C[i]
        if x == UNDEF
            println("undecidable")
        else
            println("$x $y")
        end
    end
    

end



function dfs!(node, route, G, seen_set, routes)
    push!(route, node)
    push!(seen_set, node)
    if leaf(G, node, seen_set)
        push!(routes, route)
        return
    else
        for next in G[node]
            if !(next in seen_set)
                new_route = copy(route)
                dfs!(next, new_route, G, seen_set, routes)
            end
        end
    end
end


main()