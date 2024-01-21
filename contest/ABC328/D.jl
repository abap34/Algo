import Base: getindex, deleteat!
using ProgressBars

yesno(b::Bool) = (b ? "Yes" : "No") |> println


mutable struct DefaultString
    s::Vector{Char}
    N::Int
    default::Char
    function DefaultString(s::Vector{Char})
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

function deleteat!(s::DefaultString, i::Int)
    if i < 1 || i > s.N
        return
    end

    deleteat!(s.s, i)
    s.N -= 1
end


function check_remove(S, l, r)
    if S[l-1] == 'A' && S[l] == 'B' && S[r] == 'C'
        return 1
    end

    if S[l] == 'A' && S[r] == 'B' && S[r+1] == 'C'
        return 2
    end

    return 3
end

function finish(S)
    for i in 1:S.N-2
        if S[i] == 'A' && S[i+1] == 'B' && S[i+2] == 'C'
            return false
        end
    end

    return true
end


function main()
    S = readline()
    S = DefaultString(collect(S))
    i = 1
    while true
        if S[i] == 'A' && S[i+1] == 'B' && S[i+2] == 'C'
            l = i - 1
            r = i + 3
            deleteat!(S, i)
            deleteat!(S, i)
            deleteat!(S, i)
            while true
                if l < 1 || r > S.N
                    break
                end
                if check_remove(S, l, r) == 1
                    deleteat!(S, l)
                    deleteat!(S, l)
                    deleteat!(S, r)
                    l -= 2
                    r += 1
                elseif check_remove(S, l, r) == 2
                    deleteat!(S, l)
                    deleteat!(S, r)
                    deleteat!(S, r)
                    l -= 1
                    r += 2
                else
                    break
                end
            end
            i = 1
        end
        i += 1
        if finish(S)
            break
        end

        if i > S.N - 2
            i = 1
        end
    end

    println(join(S.s))
end

main()