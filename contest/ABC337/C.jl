using OffsetArrays

yesno(b::Bool) = (b ? "Yes" : "No") |> println
function main()
    N = parse(Int, readline())
    A = parse.(Int, split(readline()))
    g = OffsetArray{Int64}(undef, 0:N)
    for i in eachindex(A)
        a = A[i]
        if a == -1
            a = 0
        end

        g[a] = i
    end

    idx = 0
    count = 0
    while count < N
        idx = g[idx]
        print(idx, " ")
        count += 1
    end

    println()
end

main()