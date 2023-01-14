parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function main()
    H, W = parseMap(split(readline()))
    field = []

    for _ in 1:H
        S = collect(readline())
        push!(field, S)
    end

    # print("  ")
    # for i in 1:W
    #     print(i)
    # end

    # #println()
    # for x in 1:H
    #     print("$x ")
    #     for y in 1:W
    #        print(field[y][x])
    #     end
    #     #println()
    # end
            
    # 横を見る
    count = 0
    for x in 2:H - 1
        for y in 2:W - 1
            if field[x][y] == '#'
                # 左上、右上、右下、左下
                if (field[x - 1][y - 1] == '.' && field[x - 1][y] == '.' && field[x][y - 1] == '.') 
                    count += 1
                    # println("$y, $x is 1 corner")
                end
                if (field[x - 1][y + 1] == '.' && field[x - 1][y] == '.' && field[x][y + 1] == '.') 
                    count += 1
                    # println("$y, $x is 2 corner")
                end
                if (field[x + 1][y + 1] == '.' && field[x + 1][y] == '.' && field[x][y + 1] == '.')
                    count += 1
                    # println("$y, $x is 3 corner")       
                end
                if (field[x + 1][y - 1] == '.' && field[x + 1][y] == '.' && field[x][y - 1] == '.')
                    count += 1
                    # println("$y, $x is 4 corner")    
                end  
            else
                if (field[x - 1][y - 1] == '#' && field[x - 1][y] == '#' && field[x][y - 1] == '#') 
                    count += 1
                    # println("$y, $x is _1 corner")
                end
                if (field[x - 1][y + 1] == '#' && field[x - 1][y] == '#' && field[x][y + 1] == '#') 
                    count += 1
                    # println("$y, $x is _2 corner")
                end
                if (field[x + 1][y + 1] == '#' && field[x + 1][y] == '#' && field[x][y + 1] == '#')
                    count += 1
                    # println("$y, $x is _3 corner")       
                end
                if (field[x + 1][y - 1] == '#' && field[x + 1][y] == '#' && field[x][y - 1] == '#')
                    count += 1
                    # println("$y, $x is _4 corner")    
                end  
            end
        end
    end
    
    println(count)

end

main()