struct UnionFind
    par::Vector{Int}
    size::Vector{Int}
    # 各連結成分の、 [1~10]番目に大きい頂点番号を持っておく. ない場合は-1
    top10::Vector{Vector{Int}}
    function UnionFind(N)
        top10 = [[-1 for _ in 1:10] for _ in 1:N]
        for i in 1:N
            top10[i][1] = i
        end

        new(collect(1:N), collect(1:N), top10)
    end
end

global DEBUG = false

function debug(args...)
    if !DEBUG
        return
    end

    println(args...)
end

function debug(uf::UnionFind)
    if !DEBUG
        return
    end

    for i in 1:length(uf.par)
        println("i = $i, par = $(uf.par[i]), size = $(uf.size[i]), top10 = $(uf.top10[i])")
    end
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

    if x == y
        return false
    end

    if uf.size[x] < uf.size[y]
        x, y = y, x
    end

    uf.size[x] += uf.size[y]

    all_cand = Int[]
    for i in 1:10
        push!(all_cand, uf.top10[x][i])
        push!(all_cand, uf.top10[y][i])
    end
    
    all_cand = sort(all_cand, rev=true)

    for i in 1:10
        uf.top10[x][i] = all_cand[i]
    end

    uf.par[y] = x
    return true


end

function kth(uf::UnionFind, x::Int, k::Int)
    x = root!(uf, x)
    debug("root of $x is $x. $k th is $(uf.top10[x][k])")
    println(uf.top10[x][k])
end



function main()
    N, Q = parse.(Int, split(readline()))
    uf = UnionFind(N)

    for i in 1:Q
        debug("============")
        debug("i = $i")

        debug(uf)
        t, u, v = parse.(Int, split(readline()))

        if t == 1
            unite!(uf, u, v)
        else
            kth(uf, u, v)
        end
    end

end

main()