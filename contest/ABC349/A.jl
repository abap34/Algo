function main()
    N = parse(Int, readline())
    A = parse.(Int, split(readline()))
    println(-sum(A))
end

main()