parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)
N,A,B = parseMap(split(readline()))
train_money = N * A
println(maximum(train_money,B))
