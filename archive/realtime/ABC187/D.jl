parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function main()
    N = parseInt(readline())
    P = []
    W = []
    S = []
    for i in 1:N
        a, b = parseMap(split(readline()))
        push!(P, 2a + b)
        push!(W, -a)
    end
    # 演説に行く -> +(a + b)
    # 行かない   -> +(-a)
    
    #どこにも行かないときの票数

    base = sum(W)

 

    sort!(P, rev=true)


    for i in 1:N
        base += P[i]
        if base > 0
            println(i)
            break
        end
    end

end

main()