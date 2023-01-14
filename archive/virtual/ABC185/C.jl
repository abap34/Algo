parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function main()
    L = parseInt(readline())
    println(binomial(L - 1, 11))
end


main()