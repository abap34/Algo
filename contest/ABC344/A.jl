function main()
    S = collect(readline())
    result = ""
    
    cond = true

    for i in eachindex(S)
        if cond
            if S[i] == '|'
                cond = false
            else
                result *= S[i]
            end
        else
            if S[i] == '|'
                cond = true
            end
        end
    end

    println(result)
end

main()