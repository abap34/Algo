function main()
    N, K, D = parse.(Int, split(readline()))
    A = parse.(Int, split(readline()))

    table = fill(-1, N, N, D)

    table[1, 1, A[1] % D + 1] = A[1]

    for i in 1:N-1
        a = A[i+1]
        table[i+1, 1, a % D + 1] = a
        for j in 1:i
            for l in 1:D
                if table[i, j, l] == -1
                    continue
                else
                    table[i+1, j+1, (l + a - 1) % D + 1] = max(table[i+1, j+1, (l + a - 1) % D + 1], table[i, j, l] + a)
                    table[i+1, j, l] = max(table[i+1, j, l], table[i, j, l])
                end
            end
        end
    end
    println(table[N, K, 1])
end


main()

