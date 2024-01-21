function score(A)
    return sum(A) - minimum(A) - maximum(A)
end


function main()
    N, X = parse.(Int, split(readline()))
    A = parse.(Int, split(readline()))
    ans = 10000
    for i in 0:100
        push!(A, i)
        s = score(A)
        if s >= X
            return i
        end
        pop!(A)
    end
    return -1
end

println(main())