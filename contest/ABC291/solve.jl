function main()
    MOD = 998244353
    N = parse(Int, readline())
    res_p = 1
    prev_a = -1
    prev_b = -1
    for i in 1:N
        a, b = parse.(Int, split(readline()))
        if i == 1
            prev_a, prev_b = a, b
            continue
        end
        if sort([a, b]) == sort([prev_a, prev_b])
            continue
        elseif (a in [prev_a, prev_b]) || (b in [prev_a, prev_b])
            if res_p == 1
                continue
            elseif i == N
                continue
            else
                res_p = ((res_p ÷ 2) + (res_p ÷ 2) * 2) % MOD
            end
        else
            res_p = (res_p * 2) % MOD 
        end
        prev_a, prev_b = a, b
    end
    return (2res_p) % MOD
end

println(main())
