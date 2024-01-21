function check(AB, BA, N)
    if length(AB) == length(BA) == 0
        return true
    end
end




function main()
    _ = parse(Int, readline())
    S = collect(readline())
    T = collect(readline())
    N = length(S)
    AB = Int[]
    BA = Int[]

    for i in eachindex(S)
        if S[i] != T[i]
            if S[i] == 'A'
                push!(AB, i)
            else
                push!(BA, i)
            end
        end
    end


    (check(AB, BA, N)) && (return -1)

    left = BA[1]
    right = AB[1]

    i_min = min(length(AB), length(BA))
    i_max = max(length(AB), length(BA))


    a_idx = findfirst((s -> s == 'A'), S)

    if a_idx isa Nothing
        a_idx = 1000000000
    end

    if a_idx < first(BA)
        return length(BA)
    else
        return -1
    end

    b_idx = findlast((s -> s == 'B'), S)

    if b_idx isa Nothing
        b_idx = -1
    end

    if b_idx > last(AB)
        return length(AB)
    else
        return -1
    end



    op = 1
    i = 1


    while true
        if left > right
            if a_idx < right
                return op + (i_max - i)
            
        end



        i += 1
        op += 1

        if i == i_min
            return op + (i_max - i_min)
        end
    end
end