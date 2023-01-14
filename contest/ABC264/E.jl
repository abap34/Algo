mutable struct UnionFind
    N :: Int
    M :: Int
    all_light_city :: Int
    par :: Vector{Int}
    size :: Vector{Int}
    n_city :: Vector{Int}
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

    # 常にxの方が小さくする(やりやすいので)
    if x > y
        x, y = y, x
    end

    # 両方発電所
    if x > uf.N
        # y is root
        if (uf.size[x] < uf.size[y])
            uf.par[x] = y
            uf.size[y] += uf.size[x]
            uf.n_city[y] += uf.n_city[x]
        # x is root
        else
            uf.par[y] = x
            uf.size[x] += uf.size[y]
            uf.n_city[x] += uf.n_city[y]
        end
    # y:発電所,  x:都市
    elseif y > uf.N && x <= uf.N
        uf.par[x] = y
        uf.size[y] += uf.size[x]
        uf.n_city[y] += uf.n_city[x]
        uf.all_light_city += uf.n_city[x]
    # 両方都市
    else
        if (uf.size[x] < uf.size[y])
            uf.par[x] = y
            uf.size[y] += uf.size[x]
            uf.n_city[y] += uf.n_city[x]
        # x is root
        else
            uf.par[y] = x
            uf.size[x] += uf.size[y]
            uf.n_city[x] += uf.n_city[y]
        end
    end
    return true
end

function count_light(uf)
    return uf.all_light_city
end

function main()
    N, M, E = parse.(Int, split(readline()))
    U = Int[]
    V = Int[]
    for i in 1:E
        u, v = parse.(Int, split(readline()))
        push!(U, u)
        push!(V, v)
    end
    Q = parse(Int, readline())
    X = Set{Int}()
    X2 = []
    for i in 1:Q
        x = parse(Int, readline())
        push!(X, x)
        push!(X2, x)
    end

    ans = []

    n_city = cat(ones(Int, N), zeros(Int, M), dims=1)
    uf = UnionFind(N, M, 0, collect(1:N+M), ones(N + M), n_city)

    # 最後に貼られている電線のみ張る

    for i in 1:E
        if !(i in X)
            unite(uf, U[i], V[i])
            unite(uf, V[i], U[i])
        end
    end

    push!(ans, count_light(uf))

    for i in Q:-1:2
        unite(uf, U[X2[i]], V[X2[i]])
        unite(uf, V[X2[i]], U[X2[i]])
        push!(ans, count_light(uf))
    end

    for a in reverse(ans)
        println(a)
    end
end

main()



