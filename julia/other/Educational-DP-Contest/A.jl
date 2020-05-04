parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function main()
    INF = 10 ^ 5
    N = parseInt(readline())
    H = parseMap(split(readline()))
    dp = fill(INF,N)
    dp[1] = 0
    for i in 2:N
        if i > 2
            o = dp[i-1] + abs(H[i-1] - H[i])
            t = dp[i-2] + abs(H[i-2] - H[i])
            dp[i] = min(o,t)
        else
            dp[i] = dp[i-1] + abs(H[i-1] - H[i])
        end
    end
    println(dp[N])
end

main()