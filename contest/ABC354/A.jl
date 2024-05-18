function main()
    H = parse(Int, readline())
    h = 0
    for i in 0:10^8
        h += 2^i
        if h > H
            println(i + 1)
            break
        end
    end
end

main()