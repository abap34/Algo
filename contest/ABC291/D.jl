function main()
    N = parse(Int, readline())
    res = 1
    prev_a = -1
    prev_b = -1
    for i in 1:N
        prev_pair = sort([prev_a, prev_b])
        a, b = parse.(Int, split(readline()))
        if sort([a, b]) == prev_pair
            continue
        elseif (a in prev_pair) || (b in prev_pair)
            res *= (3 // 2)
        else
            res *= 2
        end
        prev_a = a
        prev_b = b
        res %= 998244353
    end
    return Int(round(res))
end

println(main())
