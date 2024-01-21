function main()
    N = readline()
    S = collect(readline())

    oka = false
    okb = false
    okc = false


    for (i, s) in enumerate(S)
        if s == 'A'
            oka = true
        elseif s == 'B'
            okb = true
        elseif s == 'C'
            okc = true
        end

        if (oka && okb && okc) 
            println(i)
            break
        end
    end


end


main()