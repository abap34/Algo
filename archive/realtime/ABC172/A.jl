parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

a = parseInt(readline())

println(a + a^2 + a^3)