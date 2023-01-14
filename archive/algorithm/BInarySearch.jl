parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

N, key = parseMap(split(readline()))
A = parseMap(split(readline()))


left = -1
right = 