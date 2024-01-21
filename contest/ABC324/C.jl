
# S の方が長さが 1 だけ長いとき、　一回スキップありで diff を調べる
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


function ndiff(S, T)
    n_diff = 0
    for i in eachindex(S)
        if S[i] != T[i]
            n_diff += 1
        end
    end
    return n_diff
end




function main()
    N, T = split(readline())
    N = parse(Int, N)

    result = Int[]

    for i in 1:N

        S = readline()


        if abs(length(S) - length(T)) > 1
            continue
        end

        # 同一
        if S == T
            push!(result, i)
            continue
        end

        # Sに一文字追加で同じになるか判定
        if length(T) - length(S) == 1
            if skip_diff(T, S)
                push!(result, i)
                continue
            end
        end


        # Sを一文字削除して同じになるか判定。これはさっきのやつを反転させればいい
        if length(S) - length(T) == 1
            if skip_diff(S, T)
                push!(result, i)
                continue
            end
        end

        # 一文字置換
        if length(S) == length(T)
            if ndiff(S, T) == 1
                push!(result, i)
            end
            continue
        end
    end


    K = length(result)

    println(K)

    S = ""

    for i in 1:K
        S *= repr(result[i]) * " "
    end

    println(S)

end


main()

