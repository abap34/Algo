parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function main()
    N, Q = parseMap(split(readline()))
    A = parseMap(split(readline()))
    
end