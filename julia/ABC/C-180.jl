using Primes


parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function main()
    N = parseInt(readline())
    D = []
    for i in 1:Int(round(sqrt(N)))
        if N % i == 0
            push!(D, i)
            (i != N ÷ i) && (push!(D, N ÷ i))
        end
    end

    sort!(D)

    for d in D
        println(d)
    end
end

main()