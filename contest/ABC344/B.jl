function main()
    A = Int[]
    while true
        a = parse(Int, readline())
        push!(A, a)
        if a == 0
            break
        end
    end

    for a in reverse(A)
        println(a)
    end
    
end

main()