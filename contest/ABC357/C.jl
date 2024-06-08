white(K) = zeros(Int, 3^K, 3^K)

function levelK(K)::Matrix{Int}
    if K == 0
        return ones(Int, (1, 1))
    else
        result = repeat(levelK(K - 1), 3, 3)
        left = 3^(K - 1) + 1
        right = 2 * 3^(K - 1) 
        result[left:right, left:right] .= 0
        return result
    end
end

function main()
    N = parse(Int, readline())
    result = levelK(N)

    for i in 1:3^N
        for j in 1:3^N
            if result[i, j] == 1
                print("#")
            else
                print(".")
            end
        end
        println()
    end
end

main()