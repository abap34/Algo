MOD = 998244353

function naive(N)
    s = string(N)
    new_s = s^N
    return parse(BigInt, new_s) % MOD
end


function f(N, d)
    return (powermod(10, d * N, MOD) - 1) * N * invmod(powermod(10, d, MOD) - 1, MOD) % MOD
end



function main()
    N = parse(BigInt, readline())
    d = ndigits(N)
    println(f(N, d))
end

main()