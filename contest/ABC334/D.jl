yesno(b::Bool) = (b ? "Yes" : "No") |> println
function main()
    N, Q = parse.(Int, split(readline()))
    R = parse.(Int, split(readline()))

    sort!(R)

    C = cumsum(R)


    A = Int[]

    for i in 1:Q
        q = parse(Int, readline())
        push!(A, searchsortedlast(C, q))
    end


    for a in A
        print(a)
        print(" ")
    end

    println()
end

main()