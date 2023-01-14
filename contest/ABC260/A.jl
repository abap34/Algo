function main()
    S = readline()

    D = Dict()

    for s in S
        if haskey(D, s)
            D[s] += 1
        else
            D[s] = 1
        end
    end

    for (key, value) in D
        if value == 1
            println(key)
            return
        end
    end
    println(-1)
    return
end

main()