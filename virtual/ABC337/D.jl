function calc(S, K)
    N = length(S)
    c_current = 0
    p_current = 0

    streak = 0
    ans = 100000000
    for i in 1:N
        if S[i] == 'o' || S[i] == '.'
            streak += 1
        end

        if S[i] == 'x'
            c_current = 0
            p_current = 0
            streak = 0
        elseif S[i] == 'o'
            c_current += 1
        elseif S[i] == '.'
            p_current += 1
        end

        if streak >= K
            if p_current < ans
                ans = p_current
            end
        end
    end

    return ans
end




function main()
    H, W, K = parse.(Int, split(readline()))
    table = fill('.', H, W)
    ans = 100000000
    for i in 1:H
        table[i, :] = collect(readline())
        c = calc(table[i, :], K)
        if c < ans
            ans = c
        end
    end

    for i in 1:W
        c = calc(table[:, i], K)
        if c < ans
            ans = c
        end
    end

    println(ans)
end

main()