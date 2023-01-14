parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function main()
    N, X = parseMap(split(readline()))
    A = parseMap(split(readline()))
    for a in A
        if a != X
            print(a)
            print(" ")
        end
    end
    println()
end


main()