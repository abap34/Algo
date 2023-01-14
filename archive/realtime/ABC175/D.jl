parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)


function main()
    N, K = parseMap(split(readline()))
    P = parseMap(split(readline()))
    C = parseMap(split(readline()))
    sort!(C)
    

    
end