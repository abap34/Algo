#=
B:
- Julia version: 0.5.2
- Author: abap
- Date: 2019-12-22
=#
N = parse(readline())
A,B = split(readline())
ans = []
for (i,j) in zip(A,B)
	push!(ans,i)
	push!(ans,j)

end

for k in ans
	print(k)
end
