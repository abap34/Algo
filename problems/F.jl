using Random

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
    N, M = parseMap(split(readline()))
    G = [[] for _ in 1:N]
    uf = UnionFind(N)

    for _ in 1:M
        a, b = parseMap(split(readline()))
        push!(G[a], b)
        push!(G[b], a)
        unite(uf, a, b)
    end

    ans = 0

    for i in 1:N
        if root(uf, i) == i
            ans += 1
        end
    end

    cO = []


    for i in 1:N
        g = G[i]
        push!(cO, [length(g), i])
    end

    sort!(cO, rev=true)

    order = (x -> x[2]).(cO)
    @show order
    results = []

    for i in 1:N
        flag = false
        for j in i+1:N
            a = order[i]
            b = order[j]
            if issame(uf, a, b) && !(b in G[a])
                flag = true
                uf.par[b] = b
                uf.par[a] = a
            end
        end
        (flag) && (ans += 1)
    end

    push!(results, ans)
    
    for i in 1:10
        ans = 0

        for i in 1:N
          if root(uf, i) == i
              ans += 1
          end
        end
        shuffle!(order)
        for i in 1:N
            flag = false
            for j in i+1:N
                a = order[i]
                b = order[j]
                if issame(uf, a, b) && !(b in G[a])
                    flag = true
                    uf.par[b] = b
                    uf.par[a] = a
                end
            end
            (flag) && (ans += 1)
        end
    
        push!(results, ans)
    end

    println(mode(results))
end









main()







