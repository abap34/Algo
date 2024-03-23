parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

X,Y,A,B,C = parseMap(split(readline()))
P = parseMap(split(readline()))
Q = parseMap(split(readline()))
R = parseMap(split(readline()))

sort!(P)
sort!(Q)
sort!(R)

a = 0
for i in 1:X+Y
    if P[i] > R[i]
        
end

println(a)