function chain(result, graph, i, readed)
    readed[i] = true
    if length(graph[i]) == 0 || i == 0 
        push!(result, i)
        return i
    else
        push!(result, i)
        chain(result, graph, graph[i][1], readed)
    end
end

function main()
    N, M = parse.(Int, split(readline()))
    A = parse.(Int, split(readline()))
    graph = []
    for i in 1:N
        push!(graph, [])
    end
    for a in A
        push!(graph[a+1], a)
    end
    readed = fill(false, N)
    result = []
    for i in N:-1:1
        if readed[i] 
            continue
        else
            _result = []
            chain(_result, graph, i, readed)
            push!(result, reverse(_result)...)
        end    
    end
    for a in reverse(result)
        print("$a ")
    end
    println()
end

main()