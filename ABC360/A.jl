function main()
    S = collect(readline())
    R = 0
    for i in 1:length(S)
        if S[i] == 'R'
            R = i
            break
        end
    end

    M = 0
    for i in 1:length(S)
        if S[i] == 'M'
            M = i
            break
        end
    end

    yesno(b::Bool) = (b ? "Yes" : "No") |> println

    yesno(R < M)
end

main()