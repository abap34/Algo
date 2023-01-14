function main()
    N, T = parse.(Int, split(readline()))
    A = parse.(Int, split(readline()))

    S_time = sum(A)

    T = T % S_time

    for i in 1:N
        T -= A[i]
        if T < 0
            println("$i $(A[i]+T)")
            return 
        end
    end
end

main()