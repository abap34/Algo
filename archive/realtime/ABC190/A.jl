parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function main()
    A, B, C = parseMap(split(readline()))
    if C == 0
        while true
            if A == 0
                println("Aoki")
                break
            end
            A -= 1
            if B == 0
                println("Takahashi")
                break
            end
            B -= 1
        end
    else

        while true
            if B == 0
                println("Takahashi")
                break
            end
            B -= 1

            if A == 0
                println("Aoki")
                break
            end
            A -= 1
        end
    end
end

main()