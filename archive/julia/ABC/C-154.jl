parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)
N = parseInt(readline())
A = parseMap(split(readline()))
A = Set(A)
if length(A) == N
    println("YES")
else
    println("NO")
end        