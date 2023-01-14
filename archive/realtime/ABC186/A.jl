parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function main()
    N, W = parseMap(split(readline()))
    println(N ÷ W)
end

main()