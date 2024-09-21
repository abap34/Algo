function solve!(K, result)
    if K == 0
        return
    end
    if K < 3
        append!(result, [0] * K)
    else
        k = floor(Int, log(K) / log(3))
        push!(result, k)
        solve!(K - 3^k, result)
    end
end


function main()
    M = parse(Int, readline())

    result = []
    solve!(M, result)

    s = 0
    for r in result
        s += 3^r
    end
    if s == M - 1
        push!(result, 0)
    end

    if s == M + 1
        # 0を一つ見つけて削除
        for i in 1:length(result)
            if result[i] == 0
                deleteat!(result, i)
                break
            end
        end
    end

    s = 0
    for r in result
        s += 3^r
    end


    println(length(result))
    println(join(result, " "))
end

main()