#=
C:
- Julia version: 
- Author: abap
- Date: 2020-01-18
=#
N = parse(readline())
S = readline()
s_back = 'P'
count  =0
for i in 1:N
	s_now = S[i]
	if s_now == s_back
		count += 1
	end
	s_back = s_now
end
println(N - count)