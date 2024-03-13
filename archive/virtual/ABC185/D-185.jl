parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function main()
    N, M = parseMap(split(readline()))
    A = parseMap(split(readline()))

    if M == 0
        println(1)
        return 0
    end

    if !(1 in A)
        push!(A, 0)
    end

    if !(N in A)
        push!(A, N + 1)
    end


    sort!(A)

    d_A = []

    for i in 1:length(A) - 1
        d = A[i + 1] - A[i] - 1
        if d != 0
            push!(d_A, d)
        end
    end   


    if d_A == []
        println(0)
        return 0
    end


    width = minimum(d_A)

    ans = 0
    
    # @show d_A
    # @show A

    for i in 1:length(A) - 1
        ans += cld((A[i + 1] - A[i] - 1), width)
    end

    println(ans)
end


main()