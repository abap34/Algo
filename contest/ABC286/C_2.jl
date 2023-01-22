function n_replace(S)
    N = length(S)
    check_idx = 1:N ÷ 2
    count = 0
    for idx in check_idx
        if S[idx] != S[end - idx + 1]
            count += 1
        end
    end
    return count
end

function main()
    N, A, B = parse.(Int, split(readline()))
    S = collect(readline())
    ans = Inf
    for n_move in 0:N
        _ans = n_move * A
        slide_S = [S[n_move+1:end]..., S[1:n_move]...]
        _ans += n_replace(slide_S) * B
        if _ans < ans
            ans = _ans
        end
    end
    return ans
end


println(main())