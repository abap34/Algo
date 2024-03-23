parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function main()
    N = parseInt(readline())
    if N % 2 == 0
        println("White")
    else
        println("Black")
    end
end



main()