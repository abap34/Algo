parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)



function main()
    N = parseInt(readline())
    x = parseMap(split(readline()))
    println(sum(abs, x))
    println(sqrt(sum(abs2, x)))
    println(maximum(abs.(x)))
end


main()