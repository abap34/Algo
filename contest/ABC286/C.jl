function n_replace(S)
    N = length(S)
    println("check n replace $S")
    check_idx = 1:(N - 1) ÷ 2
    count = 0
    for idx in check_idx
        if S[idx] != S[end - idx + 1]
            count += 1
        end
    end
    return count
end

function solve(S, A, B)
    N = length(S)
    one_char = Char[]
    c_count = Dict{Char, Int}()
    for s in S
        if haskey(c_count, s)
            c_count[s] += 1
        else
            c_count[s] = 1
        end
    end
    for (char, count) in c_count
        if count == 1
            @show char
            push!(one_char, char)
        end
    end
    @show S
    one_char_idx = (s -> findfirst(c -> c == s, S)).(one_char)
    ans = Inf
    center_idx = (N + 1) ÷ 2
    println("==============================")
    for idx in one_char_idx
        println("check $(S[idx])")
        _ans = 0
        n_move = 0
        if idx > center_idx
            n_move = (idx - center_idx)
            _ans += n_move * A
        elseif idx < center_idx 
            n_move = N - (center_idx - idx)
            _ans +=  n_move * A
        else
            _ans += 0
        end
        println("move cost $_ans")
        slide_S = [S[n_move+1:end]..., S[1:n_move]...]
        _ans += n_replace(slide_S) * B
        println("replace cost $(n_replace(slide_S) * B)")
        if _ans < ans
            ans = _ans
        end
        @show _ans
        println("==============================")
    end
    return ans
end



function main()
    N, A, B = parse.(Int, split(readline()))
    S = collect(readline())
    if N % 2 == 1
        return solve(S, A, B)
    else
        
    end
end


println(main())