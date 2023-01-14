parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)


A, B, C = parseMap(split(readline()))

if A == B
    println(C)
elseif B == C
    println(A)
else
    println(B)
end