parseInt(x) = parse(BigInt, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)
const MOD =  998244353
 

function main()
    A, B, C = parseMap(split(readline()))
    A = A % MOD
    B = B % MOD
    C = C % MOD

    l = A * (A + 1) % MOD
    s = B * (B + 1) % MOD
    t = C * (C + 1) % MOD
    return (((((l * s) % MOD) * t) * invmod(8, MOD)) % MOD)
end


println((main()))