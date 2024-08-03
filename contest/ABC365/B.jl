function main()
    N = parse(Int, readline())
    A = parse.(Int, split(readline()))
    A_sorted = sort(A, rev=true)
    sl = A_sorted[2]
    for i in 1:N
        if A[i] == sl
            println(i)
            break
        end
    end
end

main()