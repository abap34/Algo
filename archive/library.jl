function count_combinations(N, K)
    #=
    1 <= a, b <= N かつ a + b = K
    を満たす(a, b)の個数 
    =#
    return min(K - 1, 2N + 1 - K)
end


function divide(A::Array{T, 1}, N::T) where T
    results = Array{Array{T, 1}, 1}(undef, N)
    div_range = cld(length(A), N) 
    for (i, s_idx) in zip(1:N, 1:div_range:length(A))
        e_idx = min(N, s_idx + div_range)
        results[i] = A[s_idx:e_idx]
    end
    return results
end


function searchmax(A::AbstractArray{T}, key::T)
    #=
    Aの中からkey以下の最小の値を返す. 
    任意のA_iについて、A_i > keyならば、-1を返す
    =#
    left = 1
    right = length(N)
    while (left < right)
        mid = left + right
        if A[mid] > key
            right = mid
        elseif A[mid] < key
            left = mid
        else
            return mid
        end
    end
    return mid
end

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


struct Permutations{T}
    a::T
    t::Int
end

