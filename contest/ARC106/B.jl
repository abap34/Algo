parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)


function main()
    N, M = parseMap(split(readline()))
    A = parseMap(split(readline()))
    B = parseMap(split(readline()))
    C = zeros(Int, N)
    Graph = [[] for i in 1:N]
    for _ in 1:M
        c, d = parseMap(split(readline()))
        push!(Graph[c], d)
        push!(Graph[d], c)
    end

    C .= B .- A


    for i in 1:N
        g = Graph[i]
        if C[i] != 0 && g == []
            return "No"
        end
    end

    if sum(C) == 0
        return "Yes"
    else
        return "No"
    end

end

println(main())