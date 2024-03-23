#=
A:
- Julia version: 
- Author: abap
- Date: 2020-01-10
=#
parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)
a = parseMap(split(readline()))
