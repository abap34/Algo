seen = Set{String}()

function naive(S::String)
    if S in seen
        return 0
    end
    push!(seen, S)

    for i in 1:length(S)-2
        if S[i] == 'A' && S[i+1] == 'B' && S[i+2] == 'A'
            new_S = S[1:i-1] * "A" * S[i+3:end]
            naive(new_S)
        end
    end

    for i in 1:length(S)-2
        if S[i] == 'B' && S[i+1] == 'A' && S[i+2] == 'B'
            new_S = S[1:i-1] * "B" * S[i+3:end]
            naive(new_S)
        end
    end
end

function solve_naive(S)
    naive(join(S))
    println("========")
    println("naive result")
    println(join(S))
    println("---------")
    # seen to vector
    r = []
    for s in seen
        push!(r, s)
    end
    # 長さでソート
    r = sort(r, by=x -> length(x), rev=true)
    for s in r
        println(s)
    end
    println("naive answer: ", length(r))

end


function main()
    N = parse(Int, readline())
    S = collect(readline())
    dp = zeros(Int, N, 2)
    if N < 3
        println(1)
        return
    end

    if N == 3
        if S == ['A', 'B', 'A'] || S == ['B', 'A', 'B']
            println(2)
        else
            println(1)
        end
        return
    end

    # dp[i][1] = i 文字までで A で終わる
    # dp[i][2] = i 文字までで B で終わる

    dp[1, 1] = S[1] == 'A' ? 1 : 0
    dp[1, 2] = S[1] == 'B' ? 1 : 0

    dp[2, 1] = S[2] == 'A' ? 1 : 0
    dp[2, 2] = S[2] == 'B' ? 1 : 0

    dp[3, 1] = S[3] == 'A' ? 1 : 0
    dp[3, 2] = S[3] == 'B' ? 1 : 0


    if S[1] == 'A' && S[2] == 'B' && S[3] == 'A'
        dp[1, 1] += 1
    end

    if S[1] == 'B' && S[2] == 'A' && S[3] == 'B'
        dp[1, 2] += 1
    end


    function isABA(i)
        return S[i-2] == 'A' && S[i-1] == 'B' && S[i] == 'A'
    end

    function isBAB(i)
        return S[i-2] == 'B' && S[i-1] == 'A' && S[i] == 'B'
    end

    for i in 4:N
        if S[i] == 'A'
            if isABA(i)
                dp[i, 1] += dp[i-1, 1] + dp[i-1, 2] + dp[i-3, 1] + dp[i-3, 2]

                dp[i, 1] -= dp[i-2, 1] 
            else
                dp[i, 1] = dp[i-1, 1] + dp[i-1, 2]
            end
        else
            if isBAB(i)
                dp[i, 2] += dp[i-1, 1] + dp[i-1, 2] + dp[i-3, 1] + dp[i-3, 2]

                dp[i, 2] -= dp[i-2, 2]
            else
                dp[i, 2] = dp[i-1, 1] + dp[i-1, 2]
            end
        end
    end

    display(dp)

    println(dp[N, 1] + dp[N, 2])

    solve_naive(S)

end


main()