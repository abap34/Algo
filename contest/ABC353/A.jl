function main()
    N = parse(Int, readline())
    H = parse.(Int, split(readline()))
    maxh = H[1]

    max_idx = -1
    for i in 2:length(H)
        if H[i] > maxh
            maxh = H[i]
            max_idx = i
            break
        end
    end

    println(max_idx)

end

main()