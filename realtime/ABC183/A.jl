parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function main()
    x = parseInt(readline())
    if x >= 0
        return x
    else
        return 0
    end
end



println(main())