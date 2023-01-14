parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)


function main()
    K = parseInt(readline())
    A,B = parseMap(split(readline()))
    for i in A:B
        if i % K == 0
            return "OK"
        end
    end
    return "NG"
end


println(main())