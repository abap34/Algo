#=
C:
- Julia version: 0.5.2
- Author: abap
- Date: 2019-12-22

A,B = parse.(split(readline()))

println(lcm(A,B))=#
parseInt(x) = parse(Int,x)
parseMap(x::Array{SubString{String}, 1}) = map(parseInt, x)
renga = parseMap(split(readline()))
println(renga)