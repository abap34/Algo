function main()
    Y = parse(Int, readline())
    if Y % 4 != 0
        println(365)
    elseif (Y % 4 == 0) && (Y % 100 != 0)
        println(366)
    elseif (Y % 100 == 0) && (Y % 400 != 0)
        println(365)
    elseif (Y % 400 == 0)
        println(366)
    else
        println(365)
    end
end

main()