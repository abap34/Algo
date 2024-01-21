function main()
    N = parse(Int, readline())
    A = parse.(Int, split(readline()))

    for start in 1:N
        current = start
        state, result = dfs(start, current, A, [], Set{Int}())
        if state
            return result
        end
    end
end


function dfs(start, current, A, result, seen)
    next = A[current]
    push!(result, next)
    if start == next
        return true, result
    elseif next in seen
        result = result[findfirst(==(next), result):end-1]
        return true, result
    else
        push!(seen, next)
        return dfs(start, next, A, result, seen)
    end
end

result = main()
m = length(result)
println(m)
for n in result
    print("$n ")
end

println()