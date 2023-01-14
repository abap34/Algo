parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function main()
    N = parseInt(readline())
    A = parseMap(split(readline()))
    if length(A) == 2
        if A[1] > A[2]
            println(2)
        else
            println(1)
        end
        return 0
    end
    now_tournament = 1:2^N
    while true
        new_tournament = []
        for i in 1:2:length(now_tournament)
            idx1 = now_tournament[i]
            idx2 = now_tournament[i + 1]
            if A[idx1] > A[idx2]
                push!(new_tournament, idx1)
            else
                push!(new_tournament, idx2)
            end
        end
        if length(new_tournament) == 2
            if A[new_tournament[1]] > A[new_tournament[2]]
                println(new_tournament[2])
            else
                println(new_tournament[1])
            end
            break
        end
        now_tournament = deepcopy(new_tournament)
    end
end


main()