function main()
    N = parse(Int, readline())
    for i in 1:N
        if i % 3 == 0
            print("x")
        else
            print("o")
        end
    end

    println()
end

main()