parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

R = parseInt(readline())
G = parseInt(readline())


println(2G - R)