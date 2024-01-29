yesno(b::Bool) = (b ? "Yes" : "No") |> println

function main()
    S = collect(readline())
    if lowercase(S[1]) == S[1]
        return false
    end

    for s in S[2:end]
        if lowercase(s) != s
            return false
        end
    end

    return true
end

yesno(main())