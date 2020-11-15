parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)
using DataStructures

function main()
    N, W = parseMap(split(readline()))
    f = FenwickTree{Int}(2*10^5 + 100)
    ST_times = []
    for i in 1:N
        s, t, p = parseMap(split(readline()))
        incdec!(f, s + 1, t + 1, p)
    end

    ok = true
    for time in 1:2*10^5 + 100
        if prefixsum(f, time) > W
            println("No")
            return 0
        end
    end
    println("Yes")
end



main()