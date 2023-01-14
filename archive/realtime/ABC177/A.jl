parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)


D, T, S = parseMap(split(readline()))


if D <=  S * T 
    println("Yes")
else
    println("No")
end