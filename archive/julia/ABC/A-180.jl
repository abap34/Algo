parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function main()
    N, A, B = parseMap(split(readline()))
    println(N - A + B)
end

main()