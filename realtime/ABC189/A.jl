parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)


function main()
    C = readline()
    if C[1] == C[2] == C[3]
        println("Won")
    else
        println("Lost")
    end
end

main()