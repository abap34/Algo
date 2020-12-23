parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function main()
    A = parseMap(split(readline()))
    println(minimum(A))
end

main()