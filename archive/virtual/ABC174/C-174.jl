parseInt(x) = parse(BigInt, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)


function naive(K::BigInt)
    for i in 1:10^6
        n = BigInt(10^i)
        if (n % K == 1)
            return i
        end
    end
    return -1
end

K = parseInt(readline())

println(naive(K))