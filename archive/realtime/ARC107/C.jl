parseInt(x) = parse(BigInt, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)
const MOD =  998244353
 

function main()
    A, B, C = parseMap(split(readline()))
    return (1 / 8) * A % MOD * (A + 1) % MOD * B % MOD * (B + 1) % MOD * C % MOD * (C + 1) % MOD
end


println(main())