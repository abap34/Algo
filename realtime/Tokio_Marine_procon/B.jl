parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

A, V = parseMap(split(readline()))
B, W = parseMap(split(readline()))
T = parseInt(readline())

d = abs(A - B)

if A != B
    if V - W != 0
        t  = d / (V - W)
    else 
        t = 10 ^ 10
    end
else
    t = 0
end

if t > 0
    if  T >= t
        println("YES")
    else
        println("NO")
    end
elseif t == 0
    println("Yes")
else
    println("NO")
end

