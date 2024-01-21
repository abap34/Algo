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

function n_cluster(uf::UnionFind)
    r = 0
    for i in 1:length(uf.size)
        if roor(uf, i) == i
            r += 1
        end
    end
    return r
end


yesno(b::Bool) = (b ? "Yes" : "No") |> println


N = parse(Int, readline())
visited :: Vector{Bool} = zeros(Bool, N)
visited[1] = true
A = parse.(Int, split(readline()))


function merge(uf, i, j)
    (visited[j] && return)

    unite!(uf, i, j)
    visited[j] = true

    a = A[i]
    x = 1
    while (i + a * x <= N)

        if visited[i + a * x]
            return
        end
        
        merge(uf, i, i + a * x)
        
        x += 1
    end

    return
end


function main()
    uf = UnionFind(N)

    for i in 1:N
        a = A[i]
        x = 1

        while (i + a * x <= N)
            merge(uf, i, i + a * x)
            x += 1
        end

    end

    answer = 1
    MOD = 998244353

    @show visited
    for i in 2:N
        if visited[i]
            answer = (answer * 2) % MOD
        end
    end

    println(answer)

end

main()