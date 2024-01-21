function solve(N, D, K)
    if N % D == 0
        naive_K = D * (K - 1)
        return K ÷ (N ÷ D)
    else
        naive_K = D * (K - 1)
        naive_K += K ÷ (lcm(N, D) ÷ D)
        if (K % D == 0) || D % K == 0
            return (naive_K - 1 % N)
        else
            return (naive_K % N)
        end
    end
end

function main()
    T = parse(Int, readline())
    for _ in 1:T
        N, D, K = parse.(Int, split(readline()))
        ans = solve(N, D, K)
        if N % K == 0
            if (ans - 1) % N < 0
                 println((ans - 1) % N + N)
            else
                println((ans - 1) % N)
            end
        else
            println(ans)
        end
    end
end


main()