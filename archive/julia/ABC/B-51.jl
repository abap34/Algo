parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function main()
    K, S = parseMap(split(readline()))
    count = 0
    for x in 0:K
        for y in 0:K
            if (x + y) <= S && (S - x - y) <= K
                # z = S - x - y
                # @show x
                # @show y
                # @show z
                # println("-----")
                count += 1
            end
        end
    end
    return count
end



println(main())