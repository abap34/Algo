struct UnionFind
    par::Array{Int,1}
    size::Array{Int,1}
    UnionFind(N) = new(collect(1:N), collect(1:N))
end

function root!(uf::UnionFind, x::Int)
    if uf.par[x] == x
        return x
    else
        return uf.par[x] = root(uf, uf.par[x])
    end
end


function issame!(uf::UnionFind, x::Int, y::Int)
    return root(uf, x) == root(uf, y)
end

function unite!(uf::UnionFind, x::Int, y::Int)
    x = root(uf, x)
    y = root(uf, y)
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