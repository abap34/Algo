parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)


function n_zyouken(dishes, AB)
    result = 0
    for ab in AB
        if dishes[ab[1]] > 0 && dishes[ab[2]] > 0
            result += 1
        end
    end
    return result
end

function main()
    N, M = parseMap(split(readline()))
    AB = []
    for i in 1:M
        A, B = parseMap(split(readline()))
        push!(AB, [A, B])
    end

    K = parseInt(readline())
    CD = []
    for i in 1:K
        C, D = parseMap(split(readline()))
        push!(CD, [C, D])
    end


    ans = -1
    for i in 0:2^K -1
        dishes = zeros(Int, N)
        pettern = digits(i, base=2, pad=N)
        for (p, cd) in zip(pettern, CD)
            c = cd[1]
            d = cd[2]
            if p == 1
                dishes[c] += 1
            else
                dishes[d] += 1
            end
        end
        result = n_zyouken(dishes, AB)
        if result > ans
            ans = result
        end                
    end
    println(ans)
end


main()