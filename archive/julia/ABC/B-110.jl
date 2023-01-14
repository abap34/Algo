parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)


function main()
    N, M, X, Y = parseMap(split(readline()))
    x = parseMap(split(readline()))
    y = parseMap(split(readline()))
    sort!(x)
    sort!(y)
    for z in X+1:Y-1
        if x[end] < z && z <= y[begin]
            println(z)
            return "No War"
        end
    end
    return "War"
end

println(main())
