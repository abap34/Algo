function main()
    N = parse(Int, readline())
    A = zeros(Int, (N, N))
    for i in 1:N
        A[i, 1:i] = parse.(Int, split(readline()))
    end

    i = 1
    for j in 1:N
        if i >= j
            i = A[i, j]
        else
            i = A[j, i]
        end
    end

    println(i)
end

main()