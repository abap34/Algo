parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function main()
    N, S, D = parseMap(split(readline()))
    result = 0
    for i in 1:N
        X, Y = parseMap(split(readline()))
        if X < S && Y > D
            return "Yes"
        end
    end
    return "No"               
end


println(main())