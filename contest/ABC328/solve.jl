import Base: getindex

yesno(b::Bool) = (b ? "Yes" : "No") |> println


struct DefaultString
    s::String
    N::Int
    default::Char
    function DefaultString(s::String)
        N = length(s)
        default = '-'
        new(s, N, default)
    end
end

function getindex(s::DefaultString, i::Int)
    if i < 1 || i > s.N
        return s.default
    end

    return s.s[i]
end

function check_remove(S, l, r, removed)
    # removed じゃなくなるところまで進む
    
end

function main()
    S = readline()
    S = DefaultString(S)
    removed = fill(false, S.N)
    for i in 1:S.N
        if S[i] == 'A' && S[i+1] == 'B' && S[i+2] == 'C'
            l = i - 1
            r = i + 3
            removed[i] = true
            removed[i+1] = true
            removed[i+2] = true
            while true
                result = check_remove(S, l, r, removed)
                if result[1] == true
                    remove_idxs = result[2]
                    for idx in remove_idxs
                        removed[idx] = true
                    end
                else
                    break
                end
            end
        end

    end

    result = ""
    for i in 1:S.N
        if i in remove_idx
            continue
        end
        result *= S[i]    
    end

    println(result)
end

main()