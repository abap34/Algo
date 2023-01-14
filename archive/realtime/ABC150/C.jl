#=
C:
- Julia version: 
- Author: abap
- Date: 2020-01-10
=#
parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)
N = parse(readline())
P = parseMap(split(readline()))
Q = parseMap(split(readline()))
println(P,Q)
#=count_P = 1
count_Q = 1
index = 1
for i in P
	count_P += i - index
	index += 1
end
index = 1
for i in Q
    println(i - index)
	count_Q += i - index
	index += 1
end
println(count_Q)
println(abs(count_P - count_Q))=#

#=p = 1
q= 1
index =1
res = 0=#
#=for (i,j) in zip(P,Q)

	index +=1
end
for i in P
	l = N - index
	p += factorial(l) * (i-1)
	index += 1
end
println(p)
for i in Q
	l = N - index
	q += factorial(N - 1) * (i-1)
	index += 1
end
println(q)
println(abs(p - q))=#
index = 1
count = 0
function ans(P)
    index = 1
count = 0
for i in P
	if i > index
		count += factorial(N - index) * i - 1
	end
end
return count
end
p = ans(P)
q = ans(Q)
println(abs(p-q))