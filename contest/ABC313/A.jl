function main()
    N = parse(Int, readline())
    A = parse.(Int, split(readline()))
    if N == 1
        println(0)
        return
    else
        a = A[1]
        max_not = maximum(A[2:end])
        println(max(0, max_not - a + 1))
    end
end

main()