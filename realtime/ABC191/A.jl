parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function main()
    V, T, S, D = parseMap(split(readline()))
    st = V * T
    en = V * S
    if st <= D <= en
        println("No")
    else
        println("Yes")
    end
end


main()