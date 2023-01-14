parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)


function main()
    X = parseInt(readline())
    money = 100
    for i in 1:100000000000000000000
        money *= 1.01
        money = floor(money)
        if money >= X
            println(i)
            break
        end
    end 
end

main()