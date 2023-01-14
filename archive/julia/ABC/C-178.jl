parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

const MOD = 10^9 + 7

function main()
    N = parseInt(readline())
    
    if N == 1
        println(0)
        return 0
    elseif N == 2
        println(2)
        return 0
    end

    a = powermod(10, N, MOD)
    b = 2 * powermod(9, N, MOD)
    c = powermod(8, N, MOD)


    println(mod(a - mod((b - c), MOD), MOD))

end

main()