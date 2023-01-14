function main()
    N, M = parse.(Int, split(readline()))
    S = String[]
    trees_tate = FenwickTree{Int64}[]
    trees_yoko = FenwickTree{Int64}[]

    for i in 1:N
        push!(trees_tate, FenwickTree{Int64}(N))
        push!(trees_yoko, FenwickTree{Int64}(N))
    end

    
    
    for i in 1:N
        _s = readline()
        for s in S
            
        push!(S, _s)
    end

    @show S

    Q = parse(Int, readline())

    for i in 1:Q
        x, y = parse.(Int, split(readline()))
    end
end

main()