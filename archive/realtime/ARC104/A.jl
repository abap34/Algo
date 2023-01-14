parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)


function main()
    A, B = parseMap(split(readline()))
    for X in -150:150
        for Y in -150:150
            if (X + Y == A) && (X - Y == B)
                println("$X $Y")
                break
            end
        end
    end
end

main()