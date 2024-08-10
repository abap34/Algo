function main()
    Q = parse(Int, readline())
    D = Dict{Int, Int}()

    function insert(x)
        if haskey(D, x)
            D[x] += 1
        else
            D[x] = 1
        end
    end

    function remove(x)
        if haskey(D, x)
            D[x] -= 1
            if D[x] == 0
                delete!(D, x)
            end
        end
    end

    function nunique()
        return length(D)
    end


    for _ in 1:Q
        # t, x = parse.(Int, split(readline()))
        input = parse.(Int, split(readline()))
        if length(input) == 1
            t = input[1]
            x = 0
        else
            t, x = input
        end
        
        if t == 1
            insert(x)
        elseif t == 2
            remove(x)
        else
            println(nunique())
        end
    end
end

main()