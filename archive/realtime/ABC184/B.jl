parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function main()
    N, X = parseMap(split(readline()))
    S = collect(readline())
    for s in S
        if s == 'x'
            X = max(0, X - 1)
        else
            X += 1
        end
    end
    println(X)
end
main()