parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function main()
    N, K = parseMap(split(readline()))
    for i in 1:K
        L, R = parseMap(split(readline()))
        
end