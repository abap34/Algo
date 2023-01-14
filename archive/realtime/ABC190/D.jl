parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function main()
    N = parseInt(readline())

    ans = 0
    r = Int(floor(sqrt(2N)))
    for af in 1:r
        if 2N % af == 0
            bef = 2N ÷ af
            if (af + bef - 1) % 2 == 0
                b = (af + bef - 1) % 2
                a = 2N - b
            # println("begin $a end $b")
                ans += 2
            end
        end
    end

    # println(results[-10:end])
    println(ans) 
end

main()