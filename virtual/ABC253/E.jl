N, M, K = parse.(Int, split(readline()))


function main(N::Int, M::Int, K::Int)
    if K == 0
        println(powermod(M, N, 998244353))
        return 
    end
    table = zeros(Int, N, M)
    for j in 1:M
        table[2, j] += max(0, M - (j + K) + 1)
        table[2, j] += max(0, j - K)
    end
    for i in 2:N-1
        c = cumsum(table[i, :])
        c_r = cumsum(reverse(table[i, :]))
        for j in 1:M
            if j - K > 0
                table[i+1, j] += c[j-K]
            end
            if M - (j + K) + 1 > 0
                table[i+1, j] += c_r[M-(j+K)+1]
            end
            table[i+1, j] = table[i+1, j] % 998244353
        end
    end
    println(sum(table[N, :]) % 998244353)
end

main(N, M, K)