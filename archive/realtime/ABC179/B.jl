parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)


function main()
    N = parseInt(readline())
    D = []
    streak = 0
    for i in 1:N
        D1, D2 = parseMap(split(readline()))
        if D1 == D2
            streak += 1
        else
            streak = 0
        end
        if streak == 3
            return "Yes"
        end
    end
    return "No"
end


println(main())