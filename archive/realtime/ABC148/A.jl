#=
A:
- Julia version: 0.5.2
- Author: abap
- Date: 2019-12-22
=#

A = parse(readline())
B = parse(readline())
not = [A,B]
V = [1,2,3]
ans = filter(x->!(x in not), V)
println(ans[1])