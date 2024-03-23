parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

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


function naive(N)
    count = 0
    for i in 1:N
        count += i * count_divisior(i)
    end
    return count
end

function main()
    bef = 0
    io = open("input.txt", "w")
    for i in 1:10^7
        res = naive(i)
        ans = res - bef
        bef = res
        print(io,"$ans ")
    end
end

@time main()