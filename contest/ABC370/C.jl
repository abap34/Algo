function main()
    S = collect(readline()) 
    T = collect(readline())
    result = []

    diff_index = []
    for i in 1:length(S)
        if S[i] != T[i]
            push!(diff_index, i)
        end
    end


    current = copy(S)

    N = length(diff_index)
    for i in 1:N
        cand = []

        for d in diff_index
            _S = copy(current)
            _S[d] = T[d]

            push!(cand, (_S, d))
        end

        sort!(cand, by = x -> x[1])

        push!(result, cand[1][1])

        diff_index = filter(x -> x != cand[1][2], diff_index)

        current = copy(cand[1][1])
    end

    println(length(result))

    for r in result
        println(join(r))
    end




end

main()