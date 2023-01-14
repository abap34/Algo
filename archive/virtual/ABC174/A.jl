parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

X = parseInt(readline())

println(X < 30 ? "No" : "Yes")