N,X,Y = parse.(split(readline()))


#println("----------")
ans = 0
gap = Y - X
println(N)
function nsolver(N,i)
    return N - i
end

for i in 2:N - 1
    without_graph = N - (gap - 1)
    out_graph = gap + 1
    
    println(max(0,
        nsolver(without_graph,i) + 
        nsolver(out_graph,i) - 1
        ))
end