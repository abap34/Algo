function f(n)
    # n未満で条件を満たす数を返す
    @assert n < 10
    if n <= 4
        return n
    else
        return n - 1
    end
end


function solve(N)
    if N == 1
        return 1
    end
    N = reverse(digits(N))
    dp = zeros(Int, (length(N), 2))
    dp[1, 1] = f(N[1])
    dp[1, 2] = (N[1] == 4) || (N[1] == 9) ? 0 : 1


    for i in 1:length(N) - 1
        # i桁目までのNが条件を満たすならdp[i][2] = 1
        if (N[i + 1] == 4) || (N[i + 1] == 9)
            dp[i + 1, 2] = 0
        else
            dp[i + 1, 2] = dp[i, 2]
        end

        dp[i + 1, 1] += dp[i, 1] * 8
        # N未満が確定しているので[0, 1, 2, 3, 5, 6, 7, 8]のどれを入れても良い
        dp[i + 1, 1] += dp[i, 2] * f(N[i + 1])
        # Nのi+1桁未満の数であって、条件を満たすものを入れる

    end
    return dp[end, 1] + dp[end, 2]
end


function main()
    A, B = parse.(Int, split(readline()))
    println((B - solve(B)) - ((A - 1) - solve(A - 1)))
end

main()