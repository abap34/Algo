parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)


prime_memo = Dict{Int, Bool}()
like_memo = Dict{Int, Bool}()

function isPrime(n)
    if haskey(prime_memo, n)
        return prime_memo[n]
    end

    if n == 1
        return false
    end
    for i in 2:sqrt(n)
        if n % i == 0
            prime_memo[n] = false
            return false
        end
    end
    prime_memo[n] = true
    return true
end


function isLike(n)
    if haskey(like_memo, n) 
        return like_memo[n]
    end
    like_memo[n] =  isPrime(n) && isPrime((n + 1) ÷ 2)
    return like_memo[n] 
end



function main()
    A = Array{Int}(undef, 10^5)
    for i in 1:10^5 - 1
        if isLike(i)
            A[i + 1] = A[i] + 1
        else
            A[i + 1] = A[i]
        end
    end
    Q = parseInt(readline())
    for _ in 1:Q
        l, r = parseMap(split(readline()))
        if l == 1
            println(A[r])
        else
            println(A[r + 1] - A[l])
        end

    end
end


main()