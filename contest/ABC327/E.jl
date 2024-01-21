using OffsetArrays


s(k) = -10 * ((9 / 10)^k - 1)

f(b, k) = (b / s(k)) - (1200 / sqrt(k))

function main()
    N = parse(Int, readline())
    Q = parse.(Int, split(readline()))

    table = OffsetArray(fill(-Inf, N, N + 1), 1:N, 0:N)
    b = OffsetArray(zeros(Float64, N, N + 1), 1:N, 0:N)

    table[:, 0] .= 0
    b[:, 0] .= 0

    table[1, 1] = f(Q[1], 1)
    b[1, 1] = Q[1]


    for i in 2:N
        for k in 1:i
            _b = 0.9 * (b[i-1, k-1]) + Q[i]
            r = f(_b, k)
            b[i, k] = max(_b, b[i-1, k])
            if table[i-1, k] > r
                # b[i, k] = b[i-1, k]
                table[i, k] = table[i-1, k]
            else
                # b[i, k] = _b                
                table[i, k] = r
            end
        end
    end

    
    println(maximum(table[:, 1:end]))
end




main()
