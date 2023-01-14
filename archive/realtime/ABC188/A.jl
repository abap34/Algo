parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function main()
    X, Y = parseMap(split(readline()))
    if abs(X - Y) < 3
        println("Yes")
    else
        println("No")
    end
end

main()