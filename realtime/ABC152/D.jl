#=
B:
- Julia version:0.5.2
- Author: abap
- Date: 2020-01-12
=#
parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)
N = parseMap(split(readline()))
N_keta = Int64(floor(log10(N))+1)
get_by_keta(num::Int64) = N ÷ (10^num)

for keta in 1:N_keta
	count += get_by_keta(keta)

end