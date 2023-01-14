parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)


function main()
    N = parseInt(readline())
    P = parseMap(split(readline()))
    P .-= collect(1:N)
    
    if sum(P) != 0
        return -1
    else
        if P[1] > 0
            P[1] -= 1
            P[2] += 1
            println(1)
        end
        for i in 2:N-1
            if P[i] > 0
                P[i] -= 1
                P[i + 1] += 1
                println(i)
            elseif P[i] < 0
                P[i] += 1
                P[i - 1] -= 1
                println(i - 1)
            end
        end
    end
end


main()