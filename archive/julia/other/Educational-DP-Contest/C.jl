parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)


function main()
    N = parseInt(readline())
    A = []
    B = []
    C = []
    for _ in 1:N
        a, b, c = parseMap(split(readline()))
        push!(A, a)
        push!(B, b)
        push!(C, c)
    end

    dp = zeros(Int, N, 3)
    dp[1, 1] = A[1]
    dp[1, 2] = B[1]
    dp[1, 3] = C[1]

    for i in 2:N
        dp[i, 1] = max(dp[i - 1, 2] + A[i], dp[i - 1, 3] + A[i])
        dp[i, 2] = max(dp[i - 1, 1] + B[i], dp[i - 1, 3] + B[i])
        dp[i, 3] = max(dp[i - 1, 1] + C[i], dp[i - 1, 2] + C[i])
    end

    println(maximum(dp[N, :]))
end 


main()