function num_to_idx(N, m)
    row = N ÷ m + 1
    col = N % m
    
    if col == 0
        row -= 1
        col = m
    end

    return (row, col)
end


# テーブルを読んでビンゴ判定をする.
# ここで 各マス目には何回目で書いたか記録されてるので、それの max をとっていきそれの最小値が答え
INF = 10000000000
function check(table)
    ans = INF
    for i in 1:size(table, 1)
        ans = min(ans, maximum(table[i, :]))
    end

    for i in 1:size(table, 2)
        ans = min(ans, maximum(table[:, i]))
    end
    
    # 左上から右下
    ans = min(ans, maximum(table[i, i] for i in 1:size(table, 1)))
    # 右上から左下
    ans = min(ans, maximum(table[i, size(table, 1) - i + 1] for i in 1:size(table, 1)))

    if ans == INF
        return -1
    else
        return ans
    end
end

function main()
    N, T = parse.(Int, split(readline()))
    A = parse.(Int, split(readline()))

    table = fill(INF, (N, N))

    for (i, a) in enumerate(A)
        row, col = num_to_idx(a, N)
        table[row, col] = i
    end

    println(check(table))
end

main()