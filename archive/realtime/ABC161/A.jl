parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)
function main()
X,Y,Z = parseMap(split(readline()))

println("$Z $X $Y")
end

main()