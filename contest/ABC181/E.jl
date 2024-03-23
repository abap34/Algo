parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function main()
    N, M = parseMap(split(readline()))
    H = parseMap(split(readline()))
    W = parseMap(split(readline()))
    sort!(H)
    
    A_g = []

    for i in 2:2:N
        push!(A_g, H[i - 1] - H[i])
    end
    
    A_k = []
    for i in 3:2:N
        push!(A_k, H[i - 1] - H[i])
    end

    Agr = [0]
    Akr = [0]

    for i in 1:length(A_g)
        push!(Agr, Agr[i] + A_g[i])
    end

    for i in 1:length(A_k)
        push!(Akr, Agr[i] + A_k[i])
    end
    @show Akr
    @show Agr
    score = 100000000000000
    for w in W
        idx = searchsortedfirst(H, w)
        if idx % 2 == 0  # 左側奇数
            @assert w - H[idx - 1] >= 0
            res = Agr[idx ÷ 2] + (w - H[idx - 1]) + (Akr[end] - Akr[idx ÷ 2])
        else
            if idx == 1
                res = Akr[end] + H[1]
            else
                res = Akr[idx ÷ 2] + (w - H[idx - 1]) + (Agr[end] - Agr[idx ÷ 2])
            end
        end
        if res < score
            @show idx
            println(w)
            @show res
            score = res
        end
    end
    return score
end



println(main())