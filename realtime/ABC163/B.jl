parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)
N,M = parseMap(split(readline()))
A = parseMap(split(readline()))
println(max(
    N - sum(A),
    -1
))
