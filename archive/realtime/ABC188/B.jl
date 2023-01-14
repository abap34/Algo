parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)


using LinearAlgebra


function main()
    N = parseInt(readline())
    A = parseMap(split(readline()))
    B = parseMap(split(readline()))
    if dot(A, B) == 0
        println("Yes")
    else
        println("No")
    end
end


main()