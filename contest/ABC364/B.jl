function main()
    H, W = parse.(Int, split(readline()))
    Si, Sj = parse.(Int, split(readline()))
    field = [collect(readline()) for _ in 1:H]
    moving = collect(readline())

    for m in moving
        if m == 'U'
            if Si > 1 && field[Si-1][Sj] == '.'
                Si -= 1
            end
        elseif m == 'D'
            if Si < H && field[Si+1][Sj] == '.'
                Si += 1
            end
        elseif m == 'L'
            if Sj > 1 && field[Si][Sj-1] == '.'
                Sj -= 1
            end
        elseif m == 'R'
            if Sj < W && field[Si][Sj+1] == '.'
                Sj += 1
            end
        end
    end

    println(Si, ' ', Sj)


end

main()