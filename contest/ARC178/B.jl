MOD = 998244353

cand(a) = 10^(a-1):(10^a)-1


function naive(a1, a2, a3)
    count = 0
    for i in cand(a1)
        for j in cand(a2)
            if ndigits(i + j) == a3
                count += 1
            end
        end
    end

    return count % MOD
end



# (a, a, a)
function same(n)
    if n == 1
        return 36
    elseif n == 2
        return 3240
    else
        return ((powermod(10, 2n - 2, MOD) * 32 % MOD) + (powermod(10, n - 1, MOD) * 4 % MOD)) % MOD
    end
end

# (a, a, a + 1)
function up1(n)
    if n == 1
        return 45
    elseif n == 2
        return 4860
    else
        return (((powermod(10, 2n - 2, MOD) * 49) - powermod(10, n, MOD)) + powermod(10, n - 1, MOD) * 6) % MOD
    end
end

# (a, a-1, a)
function down1(n)
    if n == 1
        return 1
    elseif n == 2
        return 45
    elseif n == 3
        return 4905
    else
        return (powermod(10, 2n - 3, MOD) * 7605 % MOD) + 45 * powermod(10, n - 2, MOD) % MOD
    end
end



function solve(a1, a2, a3)
    if a2 > a1
        a1, a2 = a2, a1
    end

    if (a1 > a3) || (a2 > a3)
        println(0)
        return 0
    end

    if a3 - max(a1, a2) > 1
        println(0)
        return 0
    end

    # (a, a, a)
    if a1 == a2 == a3
        println(same(a1))
        return same(a1)
    end

    # (a, a, a + 1)
    if (a3 > a1)
        println(down1(a2 + 1))
        return down1(a2 + 1)
    end

    # (a, a-1, a)
    if (a1 - 1 == a2) && (a1 == a3)
        println(down1(a2))
        return down1(a2)
    end

    if (a1 > a2) && (a1 == 3)
        println(same(a1))
        return same(a1)
    end

    println(up1(a2))

    return up1(a2)
end


function main()
    # T = parse(Int, readline())
    # for _ in 1:T
    #     a1, a2, a3 = parse.(Int, split(readline()))
    #     solve(a1, a2, a3)
    # end


for i in 1:4
    for j in 1:4
        for k in 1:4
            n = naive(i, j, k)
            s = solve(i, j, k)
            @show i, j, k
            @show n, s
            println("====================")
        end
    end
end


end

main()