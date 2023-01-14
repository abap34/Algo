parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)


function main()
    N, K = parseMap(split(readline()))
    ans = 0
    K = abs(K)
    for apb in 2:2N
        cpd = -(K - apb)
        
        if cpd < 2
            continue
        end
        min_c = max(1, max(K - apb - N, 1))
        max_c = max(1, min(cpd - 1, N))
        
        min_a = max(1, max(apb - N, 1))
        max_a = max(1, min(apb - 1, N))

        ans += (max_c - min_c + 1)  * (max_a - min_a + 1)
    end
    return ans
end



println(main())