function main()
    N = parse(Int, readline())
    A = parse.(Int, split(readline()))
    B = parse.(Int, split(readline()))

    println(maximum(A) + maximum(B))
end

main()