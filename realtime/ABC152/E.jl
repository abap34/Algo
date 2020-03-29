#=
B:
- Julia version:0.5.2
- Author: abap
- Date: 2020-01-12
=#
parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)
N = parseInt(readline())

A = parseMap(split(readline()))
x = BigInt(lcm(A))
ans = BigInt(0)
for i in A
	ans += x / i
end
anser = ans % (10^9 + 7)
println(BigInt(anser))
println(typeof(x),typeof(ans),typeof(anser))