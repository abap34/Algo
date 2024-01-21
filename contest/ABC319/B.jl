function main()
    N = parse(Int, readline())
    for i in 0:N
        find = false
        for j in 1:9
            if N % j != 0
                continue
            else
                if (i % (N ÷ j)) == 0
                    print(j)
                    find = true
                    break
                end
            end
        end
        if !(find)
            print("-")
        end
    end
    println()
end

main()