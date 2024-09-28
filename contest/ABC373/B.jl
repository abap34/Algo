function main()
    S = collect(readline())
    alpha = 'B':'Z'
    function getidx(c)
        return findfirst(x -> x == c, S)
    end

    init = getidx('A')

    l = 0
    for al in alpha
        idx = getidx(al)
        l += abs(idx - init)
        init = idx
    end

    println(l)


end

main()