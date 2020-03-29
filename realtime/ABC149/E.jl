#=
E:
- Julia version: 
- Author: abap
- Date: 2019-12-29
=#
parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)
N,M = parseMap(split(readline()))
A = parseMap(split(readline()))
power = Dict(zip(1:N,A))
sort!(collect(power),by=x->x[2])
