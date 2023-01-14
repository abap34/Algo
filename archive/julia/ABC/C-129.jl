parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function solve(N, M, A)

MOD = 1000000007
steps = fill(true, N)


for a in A
    steps[a] = false
end


dp = zeros(Int, N)

if steps[1]
    dp[1] = 1
    if steps[2]
        dp[2] = 2
    end
else
    if steps[2]
        dp[2] = 1
    end
end


for i in 3:N
    if (steps[i]) 
        dp[i] = (dp[i-2] + dp[i-1]) % MOD
    end
end

println(dp[N])

end

N, M = parseMap(split(readline()))
A = [parseInt(readline()) for _ in 1:M]

if N == 1
    println(1)
else
    solve(N, M, A)
end