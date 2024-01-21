function main()
    M = parse(Int, readline())
    S1 = collect(readline())
    S2 = collect(readline())
    S3 = collect(readline())

    cand = [
        [S1, S2, S3],
        [S1, S3, S2],
        [S2, S1, S3],
        [S2, S3, S1],
        [S3, S2, S1],
        [S3, S1, S2]
    ]

    ans = 10000000000
    for c in cand
        _ans = solve(M, c...)
        if _ans < ans
            ans = _ans
        end
    end


    if ans == 10000000000
        println(-1)
    else
        println(ans - 1)
    end

end


function solve(M, S1, S2, S3)
    ans = 10000000000
    for s in S1
        first_t = findfirst((x -> x == s), S1)

        current_idx = (first_t % M) + 1        
        second_t = findfirst((x -> x == s), append!(S2[current_idx:end], S2[begin:current_idx-1]))

        if second_t === nothing
            continue
        end

        second_t += first_t

        current_idx = (second_t % M) + 1
        third_t = findfirst((x -> x == s), append!(S3[current_idx:end], S3[begin:current_idx-1]))

        if third_t === nothing
            continue
        end

        third_t += second_t

        if third_t < ans
            ans = third_t
        end

    end
    return ans
end

main()