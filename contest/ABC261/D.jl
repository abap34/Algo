function main()
    N, M = parse.(Int, split(readline()))
    X = parse.(Int, split(readline()))
    C = zeros(Int, N)
    for i in 1:M
        c, y = parse.(Int, split(readline()))
        C[c] = y
    end
    # N = 3
    # M = 2
    # X = [1000000000, 1000000000, 1000000000]
    # C = zeros(N)
    # C[1] = 1000000000
    # C[3] = 1000000000
    if N == 1
        return X[1] + C[1]
    end
    if N < 10
        ans = 0
        for i in 0:2^N-1
            pettern = digits(i, base=2, pad=N)
            c_ans = 0
            streak = 0
            for i in 1:N
                if pettern[i] == 1
                    c_ans += X[i]
                    streak += 1
                    c_ans += C[streak]
                else
                    streak = 0
                end
            end 
            if c_ans > ans
                ans = c_ans
            end
        end
        return ans
    end
        
    table = zeros(Int, N, N + 1)
    # !!! j => j - 1
    table[1, 2] = X[1] + C[1]
    table[1, 1] = 0
    for i in 1:N-1
        table[i+1, 1] = maximum(table[i, :])
        for j in 1:N
            if j - 1 > i
                continue
            end
            table[i+1, j+1] = table[i, j] + X[i+1] + C[j]
        end
    end
    return maximum(table)
end

println(main())