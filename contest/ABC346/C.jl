function main()
    N, K = parse.(Int, split(readline()))
    A = parse.(Int, split(readline()))

    S = sum(1:K)


    _S = Set{Int}()

    for i in eachindex(A)
        if A[i] <= K
            if !(A[i] in _S)
                S -= A[i]
                push!(_S, A[i])
            end
        end
    end

    println(S)
end

main()