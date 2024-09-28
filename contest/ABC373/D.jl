const DEBUG = false
function debug(args...)
    if DEBUG
        println(args...)
    end
end


struct UnionFind
    par::Vector{Int}
    size::Vector{Int}
    UnionFind(N) = new(collect(1:N), collect(1:N))
end

function root!(uf::UnionFind, x::Int)
    if uf.par[x] == x
        return x
    else
        return uf.par[x] = root!(uf, uf.par[x])
    end
end

function issame!(uf::UnionFind, x::Int, y::Int)
    return root!(uf, x) == root!(uf, y)
end

function unite!(uf::UnionFind, x::Int, y::Int)
    x = root!(uf, x)
    y = root!(uf, y)
    (x == y) && (return true)
    if (uf.size[x] < uf.size[y])
        uf.par[x] = y
        uf.size[y] += uf.size[x]
    else
        uf.par[y] = x
        uf.size[x] += uf.size[y]
    end
    return true
end


struct Edge
    from::Int
    to::Int
    weight::Int
end


function main()
    N, M = parse.(Int, split(readline()))
    E = Edge[]
    for i in 1:M
        u, v, w = parse.(Int, split(readline()))
        push!(E, Edge(u, v, w))
    end
    adj = Vector{Tuple{Int, Int}}[]
    for i in 1:N
        push!(adj, Int[])
    end

    for e in E
        push!(adj[e.from], (e.to, e.weight))
        push!(adj[e.to], (e.from, -e.weight))
    end


    uf = UnionFind(N)

    for e in E
        unite!(uf, e.from, e.to)
    end

    result = zeros(Int, N)
    seen = zeros(Bool, N)

    function dfs(next, prev, acc, nodes)
        debug("$prev -> $next: $acc")
        seen[next] = true
        result[next] = acc
        for (to, w) in adj[next]
            if to == prev
                continue
            end
            if seen[to]
                continue
            end
            push!(nodes, to)
            nodes = dfs(to, next, acc + w, nodes)
        end
        return nodes
    end

    for i in 1:N
        if uf.par[i] == i
            nodes = dfs(i, -1, 0, [i])
            min_v = minimum(result[nodes])
            debug("traveled nodes: $nodes, vs: $(result[nodes])")
            debug("min_v: $min_v")
            cor = -10^18 - min_v
            for node in nodes
                result[node] += cor
            end
        end
    end

    println(join(result, " "))
    function verify(result)
        for r in result
            if !(-10^18 <= r <= 10^18)
                debug("out of range: $r")
                return false
            end
        end

        for e in E
            if result[e.to] - result[e.from] != e.weight
                debug("$e: $(result[e.from]) - $(result[e.to]) != $(e.weight)")
                return false
            end
        end
        return true
    end

    @assert verify(result)
end

main()