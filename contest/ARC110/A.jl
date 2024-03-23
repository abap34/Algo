parseInt(x) = parse(BigInt, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)




function isOk(N, numbers)
    for n in numbers
        if N % n != 1
            return false
        end
    end
    return true
end



function main()
    N = parseInt(readline())
    println(2329089562800 + 1)
end

main()