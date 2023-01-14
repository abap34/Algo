parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)
const INF = 1152921504606846976


function main()
    N, K = parseMap(split(readline()))
    H = parseMap(split(readline()))
    dp = fill(INF, N)
    dp[1] = 0
    dp[2] = abs(H[2] - H[1])
    for i in 1:N
        for j in i:min(i + K, N)
            dp[j] = min(dp[j], dp[i] + abs(H[j] - H[i]))
        end
    end
    # @show dp
    println(dp[N])
end

main()