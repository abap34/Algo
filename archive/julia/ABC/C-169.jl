parseFloat(x) = parse(BigFloat, x)
parseMap(x::Array{SubString{String},1}) = map(parseFloat, x)


A, B = parseMap(split(readline()))

println(Int(floor(A * B + 1e-10)))
