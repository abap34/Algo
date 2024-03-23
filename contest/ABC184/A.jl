parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function main()
    a, b = parseMap(split(readline()))
    c, d = parseMap(split(readline()))
    println(a * d - b * c)
end

main()