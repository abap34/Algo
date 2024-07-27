function main()
    N = parse(Int, readline())
    S = String[]
    for i in 1:N
        push!(S, readline())
    end

    for i in 1:N-2
        if S[i] == "sweet" && S[i+1] == "sweet"
            return false
        end
    end

    return true
end

yesno(b::Bool) = (b ? "Yes" : "No") |> println

yesno(main())