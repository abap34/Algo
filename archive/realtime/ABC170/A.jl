parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

A = parseMap(split(readline()))


for i in 1:5
    a = A[i]
    if a == 0
        println(i)
    end
end


