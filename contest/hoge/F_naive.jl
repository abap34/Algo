using DataStructures


function inversion(A::AbstractArray{T}) where T
    A_compressed = sortperm(A)
    N = length(A)
    ft = FenwickTree{T}(N)
    result = 0
    for i in eachindex(A_compressed)
        inc!(ft, A_compressed[i], 1)
        result += i - prefixsum(ft, A_compressed[i])
    end
    return result
end

function naive(N, B)
    max_b = maximum(B)
    result_table = Dict{Int, Int}()
    init_max_idx = argmax(B)
    ans = Inf
    for i in 1:N
        deleteat!(B, findall(x -> x == max_b, B))
        insert!(B, i, max_b)
        max_idx = argmax(B)
        before = B[1:max_idx-1]
        after = B[max_idx+1:end]
    
        before_inv = inversion(before)
        after_inv = inversion(reverse(after))

        _ans = before_inv + after_inv + abs(init_max_idx - i)
        if _ans < ans
            ans = _ans
        end
    end
    return ans
end

function main()
    N = parse(Int, readline())
    B = parse.(Int, split(readline()))
    println(naive(N, B))
end


main()