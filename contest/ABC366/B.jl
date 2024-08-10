function main()
    N = parse(Int, readline())
    S = fill('*', (N, 100))
    for i in 1:N
        s = collect(readline())
        S[i, 1:length(s)] .= s
    end

    for j in 1:100
        result = ""
        for i in N:-1:1
            result *= S[i, j]
        end
        while endswith(result, "*")
            result = chop(result)
        end
        if length(result) == 0
            break
        end
        println(result)
    end

end

main()