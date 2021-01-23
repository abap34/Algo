parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function main()
    A, B = parseMap(split(readline()))
    sA = sum(digits(A))
    sB = sum(digits(B))
    println(max(sA, sB))
end

main()