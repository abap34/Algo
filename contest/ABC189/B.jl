parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)


function main()
    N, X = parseMap(split(readline()))
    S = 0
    for i in 1:N
        V, P = parseMap(split(readline()))
        S += (V * P) // 100
        if S > X
            println(i)
            return 0
        end
    end
    println(-1)
end

main()