using DataStructures

function dict_to_tuple(d::Dict)::Vector{Tuple{Char, Int}}
    t = Vector{Tuple{Char, Int}}()
    for (k, v) in d
        push!(t, (k, v))
    end
    return t
end

function main()
    S = collect(readline())
    c = counter(S).map
    t = dict_to_tuple(c)
    max_v = maximum([v for (k, v) in t])
    max_keys = [k for (k, v) in t if v == max_v]
    println(sort(max_keys)[1])
end

main()