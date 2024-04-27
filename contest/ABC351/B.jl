function main()
    N = parse(Int, readline())
    A = fill('a', (N, N))
    B = fill('a', (N, N))

    for i in 1:N
        A[i, :] = collect(readline())
    end

    for i in 1:N
        B[i, :] = collect(readline())
    end

    for i in 1:N
        for j in 1:N
            if A[i, j] != B[i, j]
                println("$i $j")
                return
            end
        end
    end
end

main()