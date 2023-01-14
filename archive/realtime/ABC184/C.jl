parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)



function solve(x, y)
    
end


function main()
    r1, c1 = parseMap(split(readline()))
    r2, c2 = parseMap(split(readline()))
    x = abs(r2 - r1)
    y = abs(c2 - c1)

    
    if (x == 0) && (y == 0)
        return 0
    elseif (x == y) || (x + y <= 3)
        return 1
    else
        for i in -2:2
            for j in -2:2
                if (x + i) == (y + j)
                    return 2
                end
            end
        end

        if (x + y) % 2 == 0
            return 2
        end

        for i in -2:2
            for j in -2:2
                if ((x + y) + (i + j)) % 2 == 0
                    return 3
                end
            end
        end
    end

    return 3
end

println(main())