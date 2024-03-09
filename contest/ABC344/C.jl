function main()
    N = parse(Int, readline())
    A = parse.(Int, split(readline()))
    
    M = parse(Int, readline())
    B = parse.(Int, split(readline()))

    L = parse(Int, readline())
    C = parse.(Int, split(readline()))

    Q = parse(Int, readline())
    X = parse.(Int, split(readline()))

    ok = Set{Int}()

    for i in 1:N
        for j in 1:M
            for k in 1:L
                push!(ok, A[i] + B[j] + C[k])
            end
        end
    end

    for i in 1:Q
        if X[i] in ok
            println("Yes")
        else
            println("No")
        end
    end


end

main()