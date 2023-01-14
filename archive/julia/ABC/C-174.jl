parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function main()
    K = parseInt(readline())
    if K == 1 || K == 7
        return 1
    end
    A = Array{Int, 1}(undef, K + 1)
    A[1] = 7
    for i in 1:K
        A[i + 1] = mod(A[i] + 7 * powermod(10, i, K), K)
        if A[i + 1] % K == 0
            return i + 1
        end
    end
    return -1
end


println(main())

