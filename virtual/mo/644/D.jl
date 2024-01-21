using Primes

const MOD = 10^9 + 7

function main()
    N = parse(Int, readline())
    factors = Dict{Int, Int}()
    for i in 1:N
        for (p, e) in factor(i)
            if haskey(factors, p)
                factors[p] += e
            else
                factors[p] = e
            end
        end
    end
    ans = 1

    for (p, e) in factors
        ans = ans * (e + 1) % MOD
    end

    println(ans)
end

main()