#=
B:
- Julia version:0.5.2
- Author: abap
- Date: 2020-01-12
=#
parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)
N = parseInt(readline())
P = parseMap(split(readline()))
#P = []
#=for i in 1:N
	push!(P,(i,p[i]))
end
sort!(P,by=x->x[2])
count = 0
for (key,value) in P
		println(key," ",value)
		count += 1
end=#

#println(count)
not = 0
min = P[1]
for i in 1:N
	p = P[i]
	if p > min
		not += 1
	else
		min = p
	end
end
println(N - not)