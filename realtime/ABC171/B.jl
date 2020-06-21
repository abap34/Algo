parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)


N, K = parseMap(split(readline()))

P = parseMap(split(readline()))

sort!(P)

println(sum(P[1:K]))