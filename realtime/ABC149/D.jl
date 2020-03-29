#=
D:
- Julia version: 
- Author: abap
- Date: 2019-12-29
=#
parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)
N,K = parseMap(split(readline()))
R,S,P = parseMap(split(readline()))
t = readline()
T =[]
for j in t
	push!(T,j)
end
score = 0
for i in 1:N
	if i <= K
		if T[i] == 'r'
			score += P
			#print('p')
		elseif T[i] == 's'
			score += R
			#print('r')
		elseif T[i] == 'p'
			score += S
			#print('s')
		end
	else
		if T[i] == 'r' && T[i-K] != 'r'
			score += P
			#print('p')
		elseif T[i] == 's' && T[i-K] != 's'
			score += R
			#print('r')
		elseif T[i] == 'p' && T[i-K] != 'p'
			score += S
			#print('s')
		else
			T[i] = "*"
		end
	end
end
#println("")
#println("---")
println(score)