#=
B:
- Julia version:0.5.2
- Author: abap
- Date: 2020-01-12
=#
parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)
N,M = parse.(split(readline()))
if N==M
  println("Yes")
  else
  println("No")
end