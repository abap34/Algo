function main()
    N, M = parse.(Int, split(readline()))
    A = parse.(Int, split(readline()))
    B = parse.(Int, split(readline()))
    sort!(A)
    sort!(B)
    for i in 1:length(A) - 1
        left, right = A[i], A[i + 1]
        ok = true
        for j in eachindex(B)
            if left < B[j] < right
                ok = false
            end
        end

        if ok
            return true
        end
    end
    
    return false
end

yesno(b::Bool) = (b ? "Yes" : "No") |> println

yesno(main())