parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)
D = parse(readline())
if D == 25
    println("Christmas")
elseif D == 24
    println("Christmas Eve")    
elseif D == 23
    println("Christmas Eve Eve")
elseif D == 22
    println("Christmas Eve Eve Eve")    
end    