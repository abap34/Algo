function main()
    N = parse(Int, readline())
    A = Int[]
    C = Int[]
    for _ in 1:N
        a, c = split(readline())
        push!(A, parse(Int, a))
        push!(C, parse(Int, c))
    end

    A_perm = sortperm(A, rev=true)
    min_cost = 10^9 + 1

    discard = Set{Int}()
    for p in A_perm
        if C[p] > min_cost
            push!(discard, p)
            continue
        end
    
        
        if C[p] < min_cost
            min_cost = C[p]
        end
    end

    ok = Int[]
    for i in 1:N
        if !(i in discard)
            push!(ok, i)
        end
    end

    println(length(ok))

    for i in ok
        print("$i ")
    end

    println()
end

main()