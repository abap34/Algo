#=
B:
- Julia version: 0.5.2
- Author: abap
- Date: 2019-12-29
=#
parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)
A,B,K = parseMap(split(readline()))
if A > K
    A -= K
else
	B -= K - A
    A = 0
end

if B < 0
	B = 0
end
println("$A $B")