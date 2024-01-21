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
    H, W = parse.(Int, split(readline()))
    S = fill(0, (H, W))

    sharp_count = 0

    for i in 1:H
        _S = collect(readline())
        for j in eachindex(_S)
            if _S[j] == '#'
                sharp_count += 1
                S[i, j] = sharp_count
            else
                S[i, j] = 0
            end
        end
    end 

    diffs = [
        (0, 1),
        (1, -1),
        (1, 0),
        (1, 1)
    ]


    uf = UnionFind(sharp_count)


    function valid(x, y)
        if (x < 1) || (y < 1)
            return false
        end

        if (x > H) || (y > W)
            return false
        end

        return true
    end

    for i in 1:H
        for j in 1:W
            if S[i, j] == 0
                continue
            end

            for diff in diffs
                watch = (i, j) .+ diff
                if valid(watch...)
                    if (S[watch...]) != 0
                        unite(uf, S[i, j], S[watch...])
                    end
                end
            end


        end
    end

    result = 0
    for i in 1:sharp_count
        if root(uf, i) == i
            result += 1
        end
    end

    println(result)
end

main()