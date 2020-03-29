#=
B:
- Julia version: 
- Author: abap
- Date: 2020-01-10
=#
N = parse(readline())
S = readline()
count = 0
for i in 1:N
	s = S[i]
	if s =='A'
		if S[i+1] == 'B' && S[i+2] == 'C'
			count += 1
		end
	end
end
println(count)