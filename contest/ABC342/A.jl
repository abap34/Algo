function main()
    S = collect(readline())
    head = S[1]
    if S[1] != S[2]
        if S[2] == S[3]
            println(1)
        else
            println(2)
        end
    else
        for i in 3:length(S)
            if S[i] != head
                println(i)
                return
            end
        end
    end
end

main()