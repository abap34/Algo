function main()
    N = parse(Int, readline())
    A = parse.(Int, split(readline()))
    W = parse.(Int, split(readline()))

    H = [0 for _ in 1:N]

    for i in 1:N
        H[A[i]] = max(H[A[i]], W[i])    
    end

    S = sum(W)
    
    for i in eachindex(H)
        S -= H[i]
    end

    println(S)

end

main()