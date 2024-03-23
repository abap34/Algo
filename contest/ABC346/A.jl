function main()
    N = parse(Int, readline())
    A = parse.(Int, split(readline()))
    B = [A[i] * A[i+1] for i in 1:N-1]
    for b in B
        print(b, " ")
    end
    println()
end

main()