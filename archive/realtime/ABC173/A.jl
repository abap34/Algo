parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

N = parseInt(readline())

m = cld(N, 1000)

println(1000m - N)
