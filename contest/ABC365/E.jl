function solve(arr)
    N = length(arr)
    max_bit = 32
    prefix_xor = zeros(Int, N + 1)

    for i in 1:N
        prefix_xor[i+1] = prefix_xor[i] ⊻ arr[i]
    end

    S = 0

    for bit in 0:max_bit-1
        count = [0, 0]
        for i in 1:N+1
            current_bit = (prefix_xor[i] >> bit) & 1
            count[current_bit+1] += 1
        end

        bs = count[1] * count[2] * (1 << bit)
        S += bs
    end

    for i in 1:N
        S -= arr[i]
    end

    return S
end

function main()
    N = parse(Int, readline())
    A = parse.(Int, split(readline()))
    println(solve(A))
end

main()