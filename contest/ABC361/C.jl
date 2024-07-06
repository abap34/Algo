function main()
    N, K = parse.(Int, split(readline()))
    A = parse.(Int, split(readline()))
    sort!(A)

    ans = 10^10

    if K == N - 1
        println(0)
        return
    end

    for left_remove in 0:K
        right_remove = K - left_remove

        min_v = A[left_remove + 1]
        max_v = A[end - right_remove]


        ans = min(ans, max_v - min_v)
    end

    println(ans)

end

main()