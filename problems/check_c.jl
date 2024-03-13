parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function Takahashi(LR)
    sort!(LR)
    r = 0
    count = 0
    for lr in LR
        l, r = lr
        if l > r
            count += 1
        end
    end
    return count
end


function Aoki(LR)
    sort!(LR, by=(x -> x[2]))
    r = 0
    count = 0
    for lr in LR
        l, r = lr
        if l > r
            count += 1
        end
    end
    return count
end


function main()
    N, M = parseMap(split(readline()))
    LR = []
    for i in 1:N
        l, r = parseMap(split(readline()))
        push!(LR, (l, r))
    end
    @show LR
    @show sort!(LR)
    @show sort!(LR, by=(x -> x[2]))
    takahashi = Takahashi(LR)
    aoki = Aoki(LR)
    @show takahashi
    @show aoki
    println("result: ", takahashi - aoki)
end





main()