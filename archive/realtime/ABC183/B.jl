parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)


function main()
    Sx, Sy, Gx, Gy = parseMap(split(readline()))
    x = ((Gx * Sy) + (Sx * Gy)) / (Sy + Gy)
    println(x)
end

main()