function main()
    L, R = parse.(Int, split(readline()))
    
    if (L, R) == (1, 0)
        println("Yes")
        return
    end


    if L == R
        println("Invalid")
        return
    end

    println("No")
end

main()