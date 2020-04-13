parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)


function main()
    ans = 0
    N = parseInt(readline())
    for i in 1:N
        if (i % 3 != 0) && (i % 5 != 0)
            ans += i
        end
    end
    println(ans)
end


main()