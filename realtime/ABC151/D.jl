#=
D:
- Julia version: 
- Author: abap
- Date: 2020-01-12
=#
H,W = parse(split(readline()))

function dfs(goal, xs)
    if xs[end] == goal
        println(xs)
    else
        for p = adjacent[xs[end]]
            if p in xs; continue; end
            push!(xs, p)
            dfs(goal, xs)
            pop!(xs)
        end
    end
end