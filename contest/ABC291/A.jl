function main()
    S = collect(readline())

    for i in eachindex(S)
        if isuppercase(S[i])
            return i
        end
    end
end


println(main())