const MOD = 2^20
const N = 2^20

mutable struct MaxUnionFind
    par :: Vector{Int}
    MaxUnionFind(N) = new(collect(1:N))
end

function root(uf::MaxUnionFind, x::Int)
    if uf.par[x] == x
        return x
    else
        r = root(uf, uf.par[x])
        uf.par[x] = r
        return r
    end
end

function max(uf::MaxUnionFind, x::Int)
    return root(uf, x)
end



function update(uf, replaced, x)
    ind = (x % MOD) + 1
    if haskey(replaced, ind)
        max_v_of_continugious = max(uf, ind)
        if max_v_of_continugious == MOD
            uf.par[MOD] = 1
            replaced[1] = x
        else
            uf.par[max_v_of_continugious] = max_v_of_continugious + 1
            replaced[max_v_of_continugious + 1] = x
        end
    else
        replaced[ind] = x
        if ind == MOD
            if haskey(replaced, 1)
                uf.par[MOD] = 1
            end
            if haskey(replaced, MOD - 1)
                uf.par[MOD - 1] = MOD
            end
        elseif ind == 1
            if haskey(replaced, MOD)
                uf.par[MOD] = 1
            end
            if haskey(replaced, 2)
                uf.par[1] = 2
            end
        else
            if haskey(replaced, ind + 1)
                uf.par[ind] = ind + 1
            end
            if haskey(replaced, ind - 1)
                uf.par[ind - 1] = ind
            end
        end
    end 
end


function main()
    Q = parse(Int, readline())
    uf = MaxUnionFind(N)
    replaced = Dict{Int, Int}()
    for i in 1:Q
        t, x = parse.(Int, split(readline()))
        if t == 1
            update(uf, replaced, x)
        else
            if haskey(replaced, (x % MOD) + 1)
                println(replaced[(x % MOD) + 1])
            else
                println(-1)
            end
        end
    end
end

main()
