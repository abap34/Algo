function main()
    N, K = parse.(Int, split(readline()))
    A = parse.(Int, split(readline()))

    for a in A
        if a % K == 0 
            print("$(a ÷ K) ")
        end
    end

    println()
end

main()