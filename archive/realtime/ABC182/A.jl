parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function main()
    A, B = parseMap(split(readline()))
    max_follows = 2A + 100
    println(max_follows - B)
end


main()