function solve_naive(N, D, K)
    masu = fill(false, N)
    masu[1] = true
    current = 0
    for i in 2:K
        current = (current + D) % N
        @label check
        if masu[current + 1]
            current = (current + 1) % D
            @goto check
        end
        masu[current + 1] = true
    end
    return current
end

function solve(N, D, K)
    if N % D == 0
        naive_K = D * (K - 1)
        return K ÷ (N ÷ D)
    else
        naive_K = D * (K - 1)
        naive_K += K ÷ (lcm(N, D) ÷ D)
        if (K % D == 0) || D % K == 0 && (K != 0)
            return ((naive_K - 1) % N) - 1
        else
            return (naive_K % N) - 1
        end
    end
end

function main()
    # T = parse(Int, readline())
    T = 10
    N = 10
    D = 1:10
    for d in D
        println("-====== $d =====-")
        println("naive | solve")
        for i in 1:N
            # N, D, K = parse.(Int, split(readline()))
            naive = solve_naive(N, d, i)
            ans = solve(N, d, i)
            println("  $naive   |  $ans")
        end
    end
end


main()