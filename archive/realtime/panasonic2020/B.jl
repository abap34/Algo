parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)
H,W = parse.(split(readline()))
if H != 1 && W != 1
    println(cld(H*W,2))
else
    println(1)    
end