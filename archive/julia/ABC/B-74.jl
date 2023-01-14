parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function main()
    N = parseInt(readline())
    K = parseInt(readline())
    X = parseMap(split(readline()))
    l = 0
    for x in X
        l += min(2x, 2 * abs(x - K))
    end
    println(l)
end


main()