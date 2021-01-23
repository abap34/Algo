parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)




function calc(a, b)
    ((a[1] - b[1]) == 0) && (return 100000000000)
    return (a[2] - b[2]) / (a[1] - b[1]) 
end


function main()
    N = parseInt(readline())
    xy = []
    for _ in 1:N
        x, y = parseMap(split(readline()))
        push!(xy, (x, y))
    end

    count = 0

    for i in 1:N
        for j in i+1:N
            if -1 <= calc(xy[i], xy[j]) <= 1
                # println(i, " ",  j, " = ", calc(xy[i], xy[j]))
                count += 1
            end
        end
    end

    println(count)

end


main()