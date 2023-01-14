function main()
    N, M = parse.(Int, split(readline()))
    edges = []
    for i in 1:N
        push!(edges, [])
    end
    ans = 0 
    for i in 1:M
        u, v = parse.(Int, split(readline()))
        push!(edges[u], v)
        push!(edges[v], u)        
    end
    for i in 1:N
        for edge in edges[i]
            for edge2 in edges[edge]
                if i in edges[edge2]
                    ans += 1
                end
            end
        end
    end
    println(ans ÷ 6)
end

main()