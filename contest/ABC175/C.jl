parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function main()
    X, K, D = parseMap(split(readline()))
    X = abs(X)
    if X ÷ D < K
        K -= X ÷ D
        X -= D * (X ÷ D)
        if K % 2 == 1
            println(abs(X - D))
        else
            println(abs(X))
        end
    else
        X = abs(X)
        X -= D * K
        println(abs(X))
    end

end

main()