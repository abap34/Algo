function main()
    N = parse(Int, readline())
    T = readline()

    # amari
    # 0 -> x+
    # 1 -> y-
    # 2 -> x-
    # 4 -> y+


    di = 0
    pos = [0, 0]

    for i in 1:N
        command = T[i]
        if command == 'S'
            if di % 4 == 0
                pos[1] += 1
            elseif di % 4 == 1
                pos[2] -= 1
            elseif di % 4 == 2
                pos[1] -= 1
            else
                pos[2] += 1
            end
        else
            di += 1
        end
    end
    println("$(pos[1]) $(pos[2])")
end

main()