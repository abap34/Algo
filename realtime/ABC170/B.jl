parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function main()
X, Y = parseMap(split(readline()))

flag = false
for turu in 0:100
    for kame in 0:100
        if (turu * 2) + (kame * 4) == Y && turu + kame == X
            flag = true
            break
        end
    end
    if flag
        break
    end
end


if flag
    println("Yes")
else
    println("No")
end

end

main()