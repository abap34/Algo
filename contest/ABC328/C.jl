function cover_count(arr, l, r)
    left = searchsortedfirst(arr, l)
    right = searchsortedlast(arr, r)

    return right - left + 1
end


yesno(b::Bool) = (b ? "Yes" : "No") |> println
function main()
    N, Q = parse.(Int, split(readline()))
    S = collect(readline())
    L = Int[]
    R = Int[]
    
    for i in 1:Q
        l, r = parse.(Int, split(readline()))
        push!(L, l)
        push!(R, r)
    end

    # 隣り合うペアを見つけてその左の位置をもつ
    pair_left = Int[]
    for i in 1:N-1
        if S[i] == S[i+1]
            push!(pair_left, i)
        end
    end
    
    # l ~ (r - 1) で何個要素をカバーできるか二分探索で調べる
    for i in 1:Q
        l, r = L[i], R[i]
        println(cover_count(pair_left, l, r-1))
    end



end

main()