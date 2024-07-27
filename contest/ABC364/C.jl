function main()
    N, X, Y = parse.(Int, split(readline()))
    A = parse.(Int, split(readline()))
    B = parse.(Int, split(readline()))

    sort!(A, rev=true)
    sort!(B, rev=true)

    S_a = 0
    S_b = 0

    for i in 1:N
        S_a += A[i]
        S_b += B[i]

        if S_a > X || S_b > Y
            println(i)
            return
        end
    end

    println(N)
end

main()