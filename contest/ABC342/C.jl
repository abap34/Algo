function main()
    N = parse(Int, readline())
    S = collect(readline())
    Q = parse(Int, readline())

    alphas = collect('a':'z')


    for i in 1:Q
        c, d = split(readline())

        c = c[1]
        d = d[1]

        if c == d
            continue
        end

        for (i, a) in enumerate(alphas)
            if a == c
                alphas[i] = d
            end
        end
    end

    replace_d = Dict{Char,Char}()

    for (i, a) in enumerate(alphas)
        replace_d[('a':'z')[i]] = alphas[i]
    end

    for i in 1:N
        print(replace_d[S[i]])
    end

    println()
end

main()