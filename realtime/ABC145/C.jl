#=
C:
- Julia version: 
- Author: abap
- Date: 2019-11-16
=#
N = parse(readline())
xy = []
for i in 1:N
    push!(xy,parse.(split(readline())))
end

get_length(a, b) = sqrt((a[1] - b[1])^2 + (a[2] - b[2])^2)

len = []
if N!=2
for i in 1:N
    for j in i+1:N
        push!(len,get_length(xy[i],xy[j]))
    end
end
println(sum(len)/(N/2))
else
    println(get_length(xy[1],xy[2]))
end

#=o = factorial(N-1)
oo = o*(N-1)

sums = sum(len.*oo)

println(sums/factorial(N))
=#
