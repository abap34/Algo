function main()
    N = parse(Int, readline())
    X = parse.(Int, split(readline()))
    sort!(X)
    picked = X[N+1:end-N]
    return sum(picked) / 3N
end

println(main())