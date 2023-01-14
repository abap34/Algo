parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

A,B,C,K = parseMap(split(readline()))

ans = 0
if A + B > K
    println(min(A,K))
else
    ans += A
    ans -= K - (A + B)
    println(ans)
end