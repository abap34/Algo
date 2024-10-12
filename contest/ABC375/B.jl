function main()
    N = parse(Int, readline())
    X = []
    Y = []
    for i in 1:N
        x, y = parse.(Int, split(readline()))
        push!(X, x)
        push!(Y, y)
    end

    ans = 0
    x, y = (0, 0)
    for i in 1:N
        ans += sqrt((X[i] - x)^2 + (Y[i] - y)^2)
        x, y = X[i], Y[i]
    end

    ans += sqrt(X[end]^2 + Y[end]^2)
    println(ans)
end

main()