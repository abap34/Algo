function main()
    N = parse(Int, readline())
    P = parse.(Int, split(readline()))
    Q = parse(Int, readline())

    D = Dict{Int, Int}()
    for i in eachindex(P)
        D[P[i]] = i
    end

    for _ in 1:Q
        a, b = parse.(Int, split(readline()))
        if D[a] < D[b]
            println(a)
        else
            println(b)
        end
    end

end

main()