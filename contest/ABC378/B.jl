function main()
    N = parse(Int, readline())
    Q = Int[]
    R = Int[]

    for _ in 1:N
        q, r = parse.(Int, split(readline()))
        push!(Q, q)
        push!(R, r)
    end


    n_Q = parse(Int, readline())
    T = Int[]
    D = Int[]
    for _ in 1:n_Q
        t, d = parse.(Int, split(readline()))
        push!(T, t)
        push!(D, d)
    end

    for i in 1:n_Q
        t, d = T[i], D[i]
        q, r = Q[t], R[t]

        if d % q == r
            println(d)
        else
            println(d + (q - d % q + r) % q)
        end
    end
end

main()