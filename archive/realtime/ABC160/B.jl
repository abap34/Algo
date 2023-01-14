parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

X = parseInt(readline())

gohyaku = X ÷ 500
go = (X - (500*gohyaku)) ÷ 5

println(1000 * gohyaku + 5 * go)