using Printf

memo = Dict{Vector{Int}, Int}()

function drop_kth(arr, drop_idx)
    return arr[(!in).(arr, Ref(drop_idx))]
end


function solve(nodes::Vector{Int})
    if haskey(memo, nodes)
        return memo[nodes]
    end
    if length(nodes) == 2
        return D[nodes[1], nodes[2]] 
    end
    res = -1
    for i in 1:length(nodes)
        for j in 1:length(nodes)
            if i == j
                continue
            else
                new_node = drop_kth(nodes, [i, j])
                r = solve(new_node)
                memo[new_node] = r
                res = max(res, D[nodes[i], nodes[j]] + r)
            end
        end
    end
    memo[nodes] = res
    @show memo
    return res
end


function main()
    N = parse(Int, readline())
    global D = zeros(Int, N, N)
    for i in 1:N-1
        d = parse.(Int, split(readline()))
        for j in eachindex(d)
            D[i, i+j] = d[j]
            D[i+j, i] = d[j]
        end
    end
    @show memo
    @show unique(values(memo))
    @show D
    println(solve(collect(1:N)))
end


main()