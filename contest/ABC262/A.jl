Y = parse(Int, readline())

m = Y % 4

if m  == 2
    println(Y)
elseif m == 1
    println(Y + 1)
elseif m == 3
    println(Y + 3)
elseif m == 0
    println(Y + 2)
end

    