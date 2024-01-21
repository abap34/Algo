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





# UnionFindで二部グラフかどうかを判定. 
# O(M * α(N))  (Mは辺数)
function is_bipartite(N::Int, edges)
    uf = UnionFind(2N)
    # i := i ノードの黒
    # 2i := i ノードの白
    for edge in edges
        from, to = edge
        unite!(uf, from, 2to)
        unite!(uf, 2from, to)
    end

    # 各 i について同じ連結成分にあったらおかしい
    for i in 1:N
        if issame!(uf, i, 2i)
            return false
        end
    end

    return true
end




# S の方が長さが 1 だけ長いとき、　一回スキップありで diff を調べる
# O(N)
function skip_diff(S, T)
    S_idx = 1
    T_idx = 1
    use_skip = false
    N_T = length(T)
    while true
        if S[S_idx] != T[T_idx]
            if use_skip
                return false
            else
                S_idx += 1
                use_skip = true
            end
        else
            if T_idx == N_T 
                return true
            end
            S_idx += 1
            T_idx += 1
        end
    end
    return false
end



# nums を並び替えて target にできるか？
# O(Nlog(N))
function ok(target, nums)
    if target == 0
        if unique(nums) == [0]
            return true
        end
    end
    
    target_digits = digits(target)
    if length(target_digits) < length(nums)
        for _ in 1:length(nums) - length(target_digits)
            push!(target_digits, 0)
        end
    elseif length(target)
    end

    sort!(target_digits)

    sort!(nums)

    if target_digits == nums
        return true
    else
        return false
    end

end



# sort 済みの arr を渡すと x 以上の要素の数をカウントして返す 
# O(log(N))
function over_count(arr, x)
    return length(arr) - searchsortedfirst(arr, x) + 1
end



yesno(b::Bool) = (b ? "Yes" : "No") |> println
