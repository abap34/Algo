using Base.Iterators

const INF = 10^9

function solve_naive(N, S)
    
    cand = ['R', 'S', 'P']
    win_map = Dict('R' => 'S', 'S' => 'P', 'P' => 'R')

    res = []

    ans = 0
    for p in Iterators.product([cand for _ in 1:N]...)
        _ans = 0
        p = collect(p)
        for i in 1:N
            if p[i] == win_map[S[i]]
                _ans += 1
                break
            elseif win_map[S[i]] == p[i]
                _ans = -INF
            end
        end

        for i in 1:N-1
            if p[i] == p[i + 1]
                _ans = -
            end
        end 

        if _ans > ans
            ans = _ans
            res = p
        end

    end

    return ans, res
end



function main()
    N = parse(Int, readline())
    S = collect(readline())
    @show solve_naive(N, S)
    hand_to_num = Dict('R' => 1, 'S' => 2, 'P' => 3)
    S = [hand_to_num[s] for s in S]

    
    # DP_i, 1 := 最後に R を出したときの最大勝利
    # DP_i, 2 := 最後に S を出したときの最大勝利
    # DP_i, 3 := 最後に P を出したときの最大勝利
    # ルール違反 (負ける、二回同じ手を出す -> -INF

    DP = fill(-INF, N, 3)
    win_map = Dict(1 => 3, 2 => 1, 3 => 2)
    # 二回連続で同じ手を出せないことに注意すると、遷移は

    # DP[1, あいこ] = 0
    # DP[1, 勝ち] = 1
    # DP[1, 負け] = -INF

    # DP[i, あいこ] = max(DP[i - 1, 自分以外の手])
    # DP[i, 勝ち] = max(DP[i - 1, 自分以外の手]) + 1
    # DP[i, 負け] = -INF

    DP[1, S[1]] = 0
    DP[1, win_map[S[1]]] = 1
    
    for i in 2:N
        for j in 1:3
            other1 = j % 3 + 1
            other2 = (j + 1) % 3 + 1

            if j == win_map[S[i]]
                DP[i, j] = max(DP[i - 1, other1], DP[i - 1, other2]) + 1
            elseif j == S[i]
                DP[i, j] = max(DP[i - 1, other1], DP[i - 1, other2])
            else
                DP[i, j] = -INF
            end
        end
    end

    display(DP)


    println(maximum(DP[N, :]))

end


main()