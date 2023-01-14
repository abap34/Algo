parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function main()
    N = parseInt(readline())
    A = parseMap(split(readline()))
    println(gcd(A))
end

main()
