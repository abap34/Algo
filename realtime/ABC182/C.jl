parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)


function main()
    N = digits(parseInt(readline()))
    ans = 1000000
    for i in 1:2^(length(N)) - 1
        c_sum = 0
        pettern = digits(i, base=2, pad=length(N))
        for j in 1:length(pettern)
            if pettern[j] == 1
                c_sum += N[j]
            end
        end
        if c_sum % 3 == 0
            if ans > length(N) - sum(pettern)
                ans = length(N) - sum(pettern)
            end
        end
    end

    if ans == 1000000
        println(-1)
    else
        println(ans)
    end
end


main()