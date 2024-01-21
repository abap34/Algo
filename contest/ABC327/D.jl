yesno(b::Bool) = (b ? "Yes" : "No") |> println

using OffsetArrays

struct UnionFind
    par :: Array{Int, 1}
    size :: Array{Int, 1}
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

function n_cluster(uf::UnionFind)
    r = 0
    for i in 1:length(uf.size)
        if roor(uf, i) == i
            r += 1
        end
    end
    return r
end



function is_bipartite(N::Int, edges)
    uf = UnionFind(2N)
    for edge in edges
        from, to = edge
        unite!(uf, from, to + N)
        unite!(uf, from + N, to)
    end

    # 各 i について同じ連結成分にあったらおかしい
    for i in 1:N
        if issame!(uf, i, i + N)
            return false
        end
    end

    return true
end

function main()
    N, M = parse.(Int, split(readline()))
    A = parse.(Int, split(readline()))
    B = parse.(Int, split(readline()))
    
    edges = Tuple{Int, Int}[]

    for i in eachindex(A)
        push!(edges, (A[i], B[i]))
    end

    result = is_bipartite(N, edges)

    yesno(result)
end


main()