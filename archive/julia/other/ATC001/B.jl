parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

struct UnionFind
    par :: Array{Int, 1}
    size :: Array{Int, 1}
    UnionFind(N) = new(collect(1:N), collect(1:N))
end

function root(uf::UnionFind, x::Int)
    if uf.par[x] == x
        return x
    else
        return uf.par[x] = root(uf, uf.par[x])
    end
end

function issame(uf::UnionFind, x::Int, y::Int)
    return root(uf, x) == root(uf, y)
end

function unite(uf::UnionFind, x::Int, y::Int)
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

function main()
    N, Q = parseMap(split(readline()))
    uf = UnionFind(N)
    for _ in 1:Q
        P, A, B = parseMap(split(readline()))
        if P == 0
            unite(uf, A + 1, B + 1)
        else
            if issame(uf, A + 1, B + 1)
                println("Yes")
            else
                println("No")
            end
        end
    end
end

main()