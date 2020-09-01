parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)




function count_change(S, T)
    count = 0
    #@show S
    #@show T
    for (s, t) in zip(S, T)
        if s != t
            count += 1
        end
    end
    return count
end

function main()
    S = collect(chomp(readline()))
    T = collect(chomp(readline()))
    min_count = 100000
    for i in 1:length(S) - length(T) + 1
        now_count = count_change(S[i:i + length(T)-1], T)
        if min_count > now_count
            min_count = now_count
        end
    end
    println(min_count)
end

main()