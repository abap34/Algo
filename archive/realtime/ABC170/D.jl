parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

using  Primes



function diviros(n)
    lower_divisors , upper_divisors = [], []
    i = 1
    while i*i <= n
        if n % i == 0
            push!(lower_divisors, i)
            if i != n ÷ i
                push!(upper_divisors, i)
            end
        end      
    i += 1
    end
    return append!(lower_divisors, upper_divisors)
end

function f(n)
    res = []
    for i in 1:10^6
        if n * i >= 10 ^ 6
            break
        else
            push!(res, n * i)
        end
    end
    return res
end

function main()

N = parseInt(readline())
A = parseMap(split(readline()))
B = []
memo = Dict{Int, Bool}()
count = 0
ans = 0
ok = false
for a in A
    ns = diviros(a)
    for n in ns
    if !(haskey(memo, n))
        ok = true
        count = -1
        for a in A
            if n == a
                count += 1    
            end
            if count == 1
                ok = false
                break
            end
        end
        D = diviros(n)
        for d in D
            memo[d] = ok
        end
    else
        ok = memo[n]
    end
    end

        

    if ok
        ans += 1
    end
end

println(ans)
end

@time main()