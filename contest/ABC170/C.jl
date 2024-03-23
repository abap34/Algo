parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function main()


X, N = parseMap(split(readline()))

if N != 0
    P = parseMap(split(readline()))
    for e in 0:100
        x = X - e
        if !(x in P)
            println(x)
            break
        end
        x2 = X + e
        if !(x2 in P)
            println(x2)
            break
    end
    end
else
    println(X)
end



end

main()
