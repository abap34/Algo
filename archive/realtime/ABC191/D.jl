parseInt(x) = parse(Int, x)
parseFloat(x) = parse(Float64, x)
parseMap(x::Array{SubString{String},1}) = map(parseFloat, x)

function isIn(X, Y, R)
    return sqrt(X^2 + Y^2) <= R
end

function main()
    X, Y, R = parseMap(split(readline()))
    X *= 10000
    Y *= 10000
    R *= 10000
    ans = 0 
    for i in -R:10000:R
        for j in -R:10000:R
            # @show i-X, j-Y
            if isIn((i-X) ÷ 10000, (j-Y) ÷ 10000, R)
                println("$((i-X) ÷ 10000) $((j-Y) ÷ 10000) in circle")
                ans += abs((2i) ÷ 10000)
                @show ans
                println("------")
                break
            end
        end
    end
    println(ans)
end

main()