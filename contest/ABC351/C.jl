function merge!(R)
    if length(R) <= 1
        return
    end

    if R[end] == R[end-1]
        last = pop!(R)
        last2 = pop!(R)
        push!(R, last + 1)
    else
        return
    end

    return merge!(R)
end


function main()
    N = parse(Int, readline())
    A = parse.(Int, split(readline()))

    R = Int[]

    for i in 1:N
        push!(R, A[i])

        merge!(R)

    end


    println(length(R))

end

main()