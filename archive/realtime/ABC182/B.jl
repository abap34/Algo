parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function main()
    N = parseInt(readline())
    A = parseMap(split(readline()))
    count = -1
    ans = 0
    for k in 2:1000
        n_count = 0
        for a in A
            if a % k == 0
                n_count  += 1
            end
        end
        if n_count > count
            count = n_count
            ans = k
        end
    end

    println(ans)
end

main()