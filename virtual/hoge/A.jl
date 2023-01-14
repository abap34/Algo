parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function main()
    Ns = parseMap(split(readline()))
    sort!(Ns)
    if Ns == [1, 4, 7, 9]
        return "YES"
    else
        return "NO"
    end
end

println(main())