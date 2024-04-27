function main()
    N = parse(Int, readline())
    X = Int[]
    Y = Int[]

    for i in 1:N
        x, y = split(readline())
        push!(X, parse(Int, x))
        push!(Y, parse(Int, y))
    end


    for i in 1:N
        max_d = -1
        max_idx = -1
        
        for j in 1:N
            if i == j
                continue
            end

            d = (X[i] - X[j])^2 + (Y[i] - Y[j])^2
            if d > max_d
                max_d = d
                max_idx = j
            end
        end

        println(max_idx)
    end

end

main()