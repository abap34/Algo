function main()
    N = parse(Int, readline())
    S = []
    C = []
    for _ in 1:N
        s, c = split(readline())
        push!(S, s)
        push!(C, parse(Int, c))
    end

    sort!(S)

    idx = sum(C) % N

    println(S[idx + 1])


end

main()