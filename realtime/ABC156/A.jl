parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)
N,R = parse.(split(readline()))
if N>10
    println(R)
else
    ans = R + 100 * (10 - N) 
    println(ans)
end       