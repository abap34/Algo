parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

A, B = parseMap(split(readline()))

println(A * B)