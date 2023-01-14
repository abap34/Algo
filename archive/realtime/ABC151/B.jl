#=
B:
- Julia version: 
- Author: abap
- Date: 2020-01-12
=#
parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)
N, K, M = parseMap(split(readline()))
A = parseMap(split(readline()))
sum_target = M * N
ans = sum_target - sum(A)
if ans <= 0
    println(0)
elseif ans > K
    println("-1")
else
    println(ans)
end