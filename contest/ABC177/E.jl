parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)
af = 0
    ruiseki = zeros(Int, N + 1)
    for i in 1:N
        ruiseki[i + 1] = ruiseki[i] + A[i]
    end

    @show ruiseki
    for i in N:-1:2
        af += A[i]
        println("$(A[i]) * $af ")
        ans += (A[i - 1] * af) % MOD
    end
    println(ans % MOD)