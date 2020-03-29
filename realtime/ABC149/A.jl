#=
A:
- Julia version: 
- Author: abap
- Date: 2019-12-29
=#
parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)