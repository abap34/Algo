parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)


function main()
    N, M = parseMap(split(readline()))
    l = 1
    r = 2
    if M > 0 
        println("$l $(r + 5M)")
        for i in 2:N
            l += 2
            r += 2
            println("$l $r")
        end
    else
        flag = true
        for i in 3:N
            l += 2
            r += 2
            if l - 5M > 0 && flag 
                flag = false
                println("$(l - 5M) $r")
            else
                println("$l $r")
            end
        end
    end
end




main()