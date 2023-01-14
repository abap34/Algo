parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)
S,L,R = parseMap(split(readline()))

if S < L
    println(L)
elseif R < S
    println(R)
else
    println(S)
end