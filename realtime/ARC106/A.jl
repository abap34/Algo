parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)


function main()
    N = parseInt(readline())
    for A in 1:40
        for B in 1:26
            if 3 ^ A + 5 ^ B == N
                return A, B
            end
        end
    end
    return -1, -1
end


a, b = main()

if a == -1
    println(-1)
else
    println("$a $b")
end

