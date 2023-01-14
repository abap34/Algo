parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)


table = Dict{Int, Int}()


function f(x, y, z)
    return x^2 + y^2 + z^2 + x * y + y * z + z * x
end




function main()
    N = parseInt(readline())
    for x in 1:100
        for y in 1:100
            for z in 1:100
                if haskey(table, f(x, y, z))
                    table[f(x, y, z)] += 1
                else
                    table[f(x, y, z)] = 1
                end
            end
        end
    end

    for i in 1:N
        if haskey(table, i)
            println(table[i])
        else
            println(0)
        end
    end
end


main()