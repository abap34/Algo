parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)


function main()
    N = parseInt(readline())
    A = Array{Int, 1}(undef, N)
    for i in 1:N
        A[i] = parseInt(readline())
    end

    B = deepcopy(A)

    sort!(A, rev=true)

    for i in 1:N
        if A[1] != B[i]
            println(A[1])
        else
            println(A[2])
        end
    end
end


main()