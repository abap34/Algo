parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)
N,M = parse.(split(readline()))

println((N * (N - 1) + M * (M - 1)) ÷ 2)
