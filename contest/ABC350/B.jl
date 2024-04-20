function main()
    N, Q = parse.(Int, split(readline()))
    T = parse.(Int, split(readline()))
    R = fill(true, N)
    for t in T
        R[t] = !R[t]
    end

    count = 0
    for r in R
        if r
            count += 1
        end
    end

    println(count)
        
end

main()