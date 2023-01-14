function main()
    N, M = parse.(Int, split(readline()))
    
    l = []

    for i in 1:N
        push!(l, (i, 0))
    end

    for i in 1:M
        u, v = parse.(Int, split(readline()))
        for i in 1:N
            if l[i][1][end] == u 
                l[i] = ((l[i][1]..., v), l[i][2] + 1)
            elseif l[i][1][end] == v
                l[i] = ((l[i][1]..., u), l[i][2] + 1)
            end
        end
    end
    ans = 0
    seen = Set()
    @show l
    for i in 1:N
        if l[i][2] >= 3 && !(sort([l[i][1]...]) in seen)
            println([l[i][1]...])
            ans += 1
            push!(seen, sort([l[i][1]...]))
        end
    end
    println(ans)
end

main()