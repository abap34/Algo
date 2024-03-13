parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)
N = parse(readline())
A = parseMap(split(readline()))
B = parseMap(split(readline()))
for i in 1:N
    if A[i] > B[i]
        A[i] -= B[i]
    else
        A[i] = 0
        A[i+1] = maximum([A[i] - B[i] + A[i],0])
    end
end             
println(sum(A))