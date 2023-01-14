function main()
    N = parse(Int, readline())
    A = parse.(Int, split(readline()))
    ans = N
    println(ans)
    for i in 2:N
        B = A .% i
        sort!(B)
        table = zeros(Int, N^2+2, N^2+2)
        table[1, 1] = 1
        for i in 1:N
            for j in 1:N
                table[i+1, j] += table[i, j]  
                if j - 1 >= B[i] 
                    table[i+1, j] += table[i, j - B[i]] % 998244353
                end
            end
        end
        ans = 0
        for i in 1:N
            ans += table[N, i * N]
        end
        println(ans)
    end
end

main()