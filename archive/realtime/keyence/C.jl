#=
C:
- Julia version: 
- Author: abap
- Date: 2020-01-18
=#
N,K,S = parse.(split(readline()))
A = fill(1, N)
if N - K < S
for i in 1:K
	A[i] = S
end
for k in A
	print("$k ")
end
else
    A = fill(S + 1, N)
    for i in 1:K
        A[i] = S
	end
	for k in A
		print("$k ")
	end
end

println("")