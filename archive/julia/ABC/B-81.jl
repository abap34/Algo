parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function calc(n)
    count = 0
    while (n % 2 == 0)
        n ÷= 2
        count += 1
    end
    return count
end

function main()
    N = parseInt(readline())
    A = parseMap(split(readline()))
    min_count = log2(10^9) + 1
    for a in A
        if (min_count > calc(a)) 
            min_count = calc(a)
        end
    end
    return min_count
end


println(main())