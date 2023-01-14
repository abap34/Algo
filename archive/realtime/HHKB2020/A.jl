parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)


function main()
    S = readline()
    T = readline()
    if S == "Y"
        println(uppercase(T))
    else
        println(T)
    end
end

main()