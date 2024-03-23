parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function main()
    X = parseInt(readline())
    for a in -200:200
        for b in -200:200
            if a ^ 5 - b ^ 5 == X
                return "$a $b"
            end
        end
    end
end


println(main())