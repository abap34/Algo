function main()
    N = parse(Int, readline())
    r = 0
    TD = Tuple{Int, Int}[]
    for _ in 1:N
        t, d = parse.(Int, split(readline()))
        push!(TD, (t, t + d))
    end

    sort!(TD, by=x->x[2])

    r = 0
    current = 1

    for i in 1:N
        s, f = TD[i]
        if (current <= f) 
            r += 1
            current = current + 1
        end
    end

    println(r)

end

main()