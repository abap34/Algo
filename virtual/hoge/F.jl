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

function solve(N, B)
    init_max_idx = argmax(B)
    # split
    before = B[1:init_max_idx-1]
    after = B[init_max_idx+1:end]
    
    before_inv = inversion(before)
    after_inv = inversion(reverse(after))

    ans = before_inv + after_inv

    # 最大値が跨いで右へ行った時、その要素は左において何番目か
    left_rank = zeros(Int, N)
    tree = AVLTree{Int}()
    for (i, b) in enumerate(B)
        push!(tree, b)
        left_rank[i] = sorted_rank(tree, b)
    end

    # 最大値が跨いで左へ行った時、その要素は右において何番目か
    right_rank = zeros(Int, N)
    tree = AVLTree{Int}()
    for (i, b) in enumerate(reverse(B))
        push!(tree, b)
        right_rank[N - i + 1] = sorted_rank(tree, b)
    end

    @show left_rank
    @show right_rank


    init_ans = ans
    current_ans = ans

    # 左へ動かす
    result_table = Dict{Int, Int}()
    result_table[init_max_idx] = init_ans

    max_B = maximum(B)
    for max_idx in init_max_idx-1:-1:1
        # 左へ動いたとき
        # 右に一個要素が移動
        # それが右に入ればn番目, 左ではm番目だったとする
        println("$max_B を $(max_idx + 1) 番目 から $max_idx 番目 へ移動させる.")
        println("このとき跨ぐ要素は $(B[max_idx])")

        n = right_rank[max_idx]
        m = left_rank[max_idx]
        
        println("$(B[max_idx])は、右に入って $n 番目の要素となる")
        println("$(B[max_idx])は、もともと左で $m 番目の要素だった")
        
        right_len = N - max_idx 

        println("右側の長さは $right_len になるので 余計にかかる操作回数は $((right_len - n))")
        println("左側で減った操作回数は $(max_idx - m)")
        println("なので転倒数は自身の操作と合わせて$current_ans から $(current_ans + (right_len - n) - (max_idx - m) + 1) になった ")

        # 転倒数の変化は、それぞれ適切な位置に動かせば
        # 右側では降順になっていないといけないことに注意して
        current_ans = current_ans + (right_len - n) - (max_idx - m) + 1
        if current_ans < ans
            ans = current_ans
        end
        result_table[max_idx] = current_ans
        println("==========================")
    end

    println("""
        [ 右へ動かす ]
    """
    )
    # 右へ動かす
    current_ans = init_ans
    for max_idx in init_max_idx+1:N
        # 右へ動いたとき
        # 左に一個要素が移動
        # それが左に入ればn番目、右ではm番目だったとする
        println("$max_B を $(max_idx - 1) 番目 から $max_idx 番目 へ移動させる.")
        println("このとき跨ぐ要素は $(B[max_idx])")


        n = left_rank[max_idx]
        m = right_rank[max_idx]

        println("$(B[max_idx])は、左に入って $n 番目の要素となる")
        println("$(B[max_idx])は、もともと右で $m 番目の要素だった")

        right_len = N - max_idx + 1

        println("右側の長さは $right_len だったので 減った操作回数は $((right_len - m))")
        println("左側で増えた操作回数は $(max_idx - n - 1)")
        println("なので転倒数は自身の操作と合わせて$current_ans から $(current_ans + (right_len - m) - (max_idx - n - 1) + 1)になった ")

        # 転倒数の変化は、それぞれ適切な位置に動かせば
        # 右側では降順になっていないといけないことに注意して
        current_ans = current_ans - (right_len - m) + (max_idx - n - 1) + 1
        if current_ans < ans
            ans = current_ans
        end

        result_table[max_idx] = current_ans
        println("==========================")
    end
    
    @show ans
    result = sort(collect(result_table), by = x->x[1])
    return result
end

function naive(N, B)
    max_b = maximum(B)
    result_table = Dict{Int, Int}()
    init_max_idx = argmax(B)
    for i in 1:N
        deleteat!(B, findall(x -> x == max_b, B))
        insert!(B, i, max_b)
        max_idx = argmax(B)
        before = B[1:max_idx-1]
        after = B[max_idx+1:end]
    
        before_inv = inversion(before)
        after_inv = inversion(reverse(after))

        ans = before_inv + after_inv + abs(init_max_idx - i)

        result_table[i] = ans
    end
    result = sort(collect(result_table), by = x->x[1])
    return result
end

function main()
    N = parse(Int, readline())
    B = parse.(Int, split(readline()))
    ans_solve = solve(N, B)
    ans_naive = solve(N, B)
    @show ans_solve == ans_naive
    println("ans from solve:", ans_solve)
    println("ans from naive:", ans_naive)
end


main()