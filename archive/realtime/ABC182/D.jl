parseInt(x) = parse(BigInt, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function main()
    N = parseInt(readline())
    A = parseMap(split(readline()))
    RuA = zeros(Int, N+1)
    for i in 1:N
        RuA[i + 1] = RuA[i] + A[i]
    end

    # @show RuA
    # RuA[i + 1] == sum(a[1:i])
    finalS = BigInt(0)
    bestS = BigInt(0)
    d = BigInt(0)
    best_d = BigInt(0)
    for i in 1:N
        finalS = RuA[i + 1]
        if finalS > bestS
            bestS = finalS
        end
        # @show d
        # @show finalS
        # @show bestS

        if d + bestS > best_d
            best_d = d + bestS
        end
        d += finalS
    end
    println(best_d)
end

main()