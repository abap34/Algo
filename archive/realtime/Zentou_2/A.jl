#=
A:
- Julia version: 
- Author: abap
- Date: 2019-11-09
=#

parseInt(x) = parse(Int,x)

x = parseInt(readline())
if x % 2 == 0
    println(div(x,2)-1)
else
    println(div(x,2))
end