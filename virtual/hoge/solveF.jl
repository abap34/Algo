using DataStructures


function inversion(A::AbstractArray) 
    A_rank = sortperm(A)
    N = length(A)
    ft = FenwickTree{Int}(N)
    result = 0
    for i in eachindex(A_rank)
        inc!(ft, A_rank[i], 1)
        result += i - prefixsum(ft, A_rank[i])
    end
    return result
end

function nthrank!(tree::AVLTree{Int}, a::Int)
    push!(tree, a)
    return sorted_rank(tree, a)
end

function get_ranks(A::AbstractArray{T}) where T
    N = length(A)
    tree = AVLTree{T}()
    result = zeros(Int, N)
    for (i, b) in enumerate(A)
        result[i] = nthrank!(tree, b)
    end
    return result
end

function solve(N, init::AbstractArray)
    init_max_idx = argmax(init)

    before_max = init[1:init_max_idx-1]
    after_max = init[init_max_idx+1:end]
    init_without_max = [before_max..., after_max...]
    
    rank_l2r = get_ranks(init_without_max)
    rank_l2r_cumsum = cumsum(rank_l2r)

    rank_r2l = get_ranks(reverse(init_without_max))
    rank_r2l_cumsum = cumsum(rank_r2l)



    before_inv = inversion(before_max_arr)
    after_inv = inversion(after_max_arr)

    init_ans = before_inv + after_inv
    tmp_ans = init_ans

    for max_idx in init_max_idx+1:N
        # init[max_idx] append to left
        # so, left inversion difference is (n - rank_l2r[max_idx - 1]) 
        # attention: rank_l2r is created without max, index is not max_idx.  
        # init[max_idx]





    
    
