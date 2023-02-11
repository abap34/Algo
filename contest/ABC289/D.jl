function main()
    N = parse(Int, readline())
    A = parse.(Int, split(readline()))
    M = parse(Int, readline())
    B = parse.(Int, split(readline()))
    X = parse(Int, readline())
    dp = zeros(Bool, X + 10^5 + 10)
    
    X = X + 1

    m_table = zeros(Bool, length(dp))
    for b in B
        m_table[b + 1] = true
    end

    dp[1] = true
    for i in 1:X
        if dp[i]
            for move in A
                if !(m_table[i + move])
                   dp[i + move] = true
                end
            end
        end
    end


    if dp[X]
        println("Yes")
    else
        println("No")
    end

    

end

main()