using DataStructures
using Random

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

function challenge()
    N = 1000
    B = shuffle(collect(1:N))
    
    rank = get_ranks(B)

    bef_inv = inversion(B[1:end-1])
    all_inv =  inversion(B)

    return (all_inv - bef_inv) != (5 - rank[end])
end

allequal([challenge() for i in 1:1000])


inversion([5, 4, 6, 2])


# A => Bの操作回数
function inversion(A, B)
    N = length(B)
    A_replaced = replace(A, (i -> (B[i] => i)).(1:N)...)
    return inversion(A_replaced)
end

inversion([1, 7, 6, 2, 4, 5, 3], [1, 7, 6, 5, 4, 3, 2])


[1, 7, 6, 2, 4, 5, 3]

[1, 7, 2, 6, 4, 5, 3]

[1, 2, 7, 6, 4, 5, 3]



[1, 2, 7, 6, 5, 4, 3]


inversion([1, 7, 6, 2, 4, 5, 3], [1, 2, 7, 6, 5, 4, 3])

for p in 1:2^6-1
    pettern = digits(p, base=2, pad=6)
    left = []
    right = []
    for i in 1:6
        if pettern[i] == 1
            push!(left, i)
        else
            push!(right, i)
        end
    end
    sort!(left)
    sort!(right, rev=true)
    target = [left..., 7, right...]
    ans = inversion([1, 7, 6, 2, 4, 5, 3], target)
    println("$target $ans")
end