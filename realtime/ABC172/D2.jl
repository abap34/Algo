parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

using Primes


memo = Dict{Int, Int}()
function count_divisior(n)
    if haskey(memo, n)
        return memo[n]
    else
        count = 0
        for i in 1:sqrt(n)
            if n % i == 0
                count += 2
            end
        end
        memo[n] = count
        return count
    end
end


function main()
    memo = Dict{Int, Int}()
    N = parseInt(readline())
    K = 1
    for i in 2:sqrt(N)
        c = count_divisior(i)
        for i in 1:N ÷ 2

    end
end


main()