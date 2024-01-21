yesno(b::Bool) = (b ? "Yes" : "No") |> println
function main()
    N, K = parse.(Int, split(readline()))
    A = parse.(Int, split(readline()))

    S = 0
    r = -1

    D = diff(A)

    if K == 1
        return 0
    end

    if K % 2 == 1
        pushfirst!(D, 0)
        push!(D, 0)
        m = -1000

        for i in 1:length(D) - 1
            if D[i] + D[i + 1] > m
                m = D[i] + D[i + 1]
            end
        end

        return sum(D) - m

    else
        return sum(D)
    end

end

println(main())