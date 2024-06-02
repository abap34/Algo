function main()
    N, K = parse.(Int, split(readline()))
    A = parse.(Int, split(readline()))
    neg = filter(x -> x < 0, A)
    pos = filter(x -> x >= 0, A)
    result = Int[]

    if K > 0
        for n in neg
            push!(result, n)
        end
        for n in pos
            push!(result, n)
        end

        println("Yes")
        join(stdout, result, " ")
        println()
        return

    elseif K <= 0
        for p in pos
            push!(result, p)
        end

        for n in neg
            push!(result, n)
        end

        c = cumsum(result)
        if c[end] >= K
            println("Yes")
            join(stdout, result, " ")
            println()
            return
        else
            println("No")
            return
        end


        result = Int[]
        for n in neg
            push!(result, n)
        end

        for p in pos
            push!(result, p)
        end

        c = cumsum(result)

        c_min = minimum(c)

        if c_min < K
            println("No")
            return
        else
            println("Yes")
            join(stdout, result, " ")
            println()
            return
        end
    end

end

main()