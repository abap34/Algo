parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)
N,K = parse.(split(readline()))
for i in 1:1000000000
    if K^i > N
        println(i)
        break
    end
end    
    