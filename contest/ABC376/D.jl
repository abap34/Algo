const DEBUG = false

function debug(args...)
    if DEBUG
        println(args...)
    end
end

function main()
    N, M = parse.(Int, split(readline()))
    A = Int[]
    B = Int[]

    for _ in 1:M
        a, b = parse.(Int, split(readline()))
        push!(A, a)
        push!(B, b)
    end

    g = [Int[] for _ in 1:N]
    for i in 1:M
        push!(g[A[i]], B[i])
    end

    function bfs(start)
        debug("start: ", start)
        parent = fill(-1, N+1)
        q = [(start, -1)]
        dist = fill(-1, N+1)
        dist[start] = 0

        while !isempty(q)
            v, par = popfirst!(q)
            debug("v: ", v)
            for u in g[v]
                debug("--u: ", u)
                if dist[u] == -1
                    dist[u] = dist[v] + 1
                    parent[u] = v
                    push!(q, (u, v))
                elseif u != par && u == start
                    return dist[v] + 1
                end
            end
        end
        return -1  
    end

    bfs(1) |> println
end

main()
