parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function main()
    N = parseInt(readline())
    H = parseMap(split(readline()))
    dp = zeros(Int, 10^5)
    dp[1] = 0
    dp[2] = abs(H[2] - H[1])
    for i in 3:N
        dp[i] = min(dp[i - 2] + abs(H[i] - H[i - 2]), dp[i - 1] + abs(H[i] - H[i - 1]))
    end
    println(dp[N])
end

main()