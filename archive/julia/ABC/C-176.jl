parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function main()
    N = parseInt(readline())
    A = parseMap(split(readline()))
    max_height = -1
    result = 0
    for a in A
        if a  > max_height
            max_height = a
        else
            result += (max_height - a)
        end
    end

    println(result)

end

main()