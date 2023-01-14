parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function main()
    N, Q = parseMap(split(readline()))
    Graph = [[] for _ in 1:N]
    for _ in 1:N
        a, b = parseMap(split(readline()))
