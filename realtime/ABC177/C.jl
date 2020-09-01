parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)


function main()
    ans = 0
    MOD = 10^9 + 7
    N = parseInt(readline())
    A = parseMap(split(readline()))
    af = 0
    for i in N:-1:2
        af += A[i]
        ans += ((A[i - 1] % MOD) * (af % MOD)) 
        ans %= MOD
    end
    println(ans)
end


main()
