function main()
    S = collect(readline())
    T = collect(readline())

    S = uppercase.(S)

    idx = 1
    for i in 1:length(S)
        if S[i] == T[1]
            idx = i
            break
        end

        if i == length(S)
            return false
        end
    end


    for i in idx+1:length(S)
        if S[i] == T[2]
            idx = i
            break
        end

        if i == length(S)
            return false
        end
    end

    if T[3] == 'X'
        return true
    end

    for i in idx+1:length(S)
        if S[i] == T[3]
            return true
        end
    end

    return false

end

yesno(b::Bool) = (b ? "Yes" : "No") |> println

yesno(main())