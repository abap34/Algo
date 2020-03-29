#=
B:
- Julia version: 
- Author: abap
- Date: 2019-11-16
=#
N = parse(readline())
texts = readline()
if N%2 == 0
if texts[1:div(N,2)] == texts[div(N,2)+1:N]
    println("Yes")
else
    println("No")
end
else
    println("No")
end