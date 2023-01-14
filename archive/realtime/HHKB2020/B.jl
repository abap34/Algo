parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function main()
    ans = 0 
    H, W = parseMap(split(readline()))
    field = []
    for i in 1:H
        S = collect(readline())
        push!(field, S)
        for j in 1:W-1
            if S[j] == '.' && S[j + 1] == '.'
                ans += 1
            end
        end
    end
    

    for i in 1:H-1
        for j in 1:W
            if field[i][j] == '.' && field[i + 1][j] == '.'
                ans += 1
            end
        end
    end

    println(ans)


end

main()