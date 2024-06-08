function main()
    N, M = parse.(Int, split(readline()))
    A = parse.(Int, split(readline()))
    s = 0
    for i in eachindex(A)
        s += A[i]
        if s == M
            println(i)
            return
        elseif s > M
            println(i - 1)
            return
        end
    end
    println(N)
    
end

main()