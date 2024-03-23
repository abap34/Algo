function main()
    B = collect(split(readline()))
    replace_table = Dict()
    for (i, b) in enumerate(B)
        replace_table[b] = repr(i - 1)
    end
    N = parse(Int, readline())
    A_origin = Int[]
    for i in 1:N
        a = parse(Int, readline())
        push!(A_origin, a)
    end

    A_replaced = Int[]
    for a_origin in A_origin
        a_origin = repr(a_origin)
        a_replaced = replace(a_origin, replace_table...)
        a_replaced = parse(Int, a_replaced)
        push!(A_replaced, a_replaced)
    end

    sorted_index = sortperm(A_replaced)

    result = A_origin[sorted_index]

    for a in result
        println(a)
    end
end

main()      