parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function main()
    N, M, T = parseMap(split(readline()))
    t = N
    p_B = 0
    for i in 1:M
        A, B = parseMap(split(readline()))
        N -= (A - p_B) 
        if N <= 0
            return "No"
        end
        N = min(N + (B - A), t) 
        p_B = B
    end
    N -= (T - p_B)
    if N <= 0
        return "No"
    end
    return "Yes"
end

println(main())

