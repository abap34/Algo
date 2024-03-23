parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function main()
    S = chomp(readline())
    if S == "ABC"
        println("ARC")
    else
        println("ABC")
    end
end


main()