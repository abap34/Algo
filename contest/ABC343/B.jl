function main()
    N = parse(Int, readline())
    A = zeros(Int, (N, N))
    for i in 1:N
        A[i, :] = parse.(Int, split(readline()))
    end

    for i in 1:N
        for j in 1:N
            if A[i, j] == 1
                print("$j ")
            end
        end
        println()
    end
end

main()