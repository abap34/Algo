function main()
    S = collect(readline())
    N = length(S)
    l = Dict{Char,Int}()
    r = Dict{Char,Int}()

    for c in S
        if !haskey(l, c)
            l[c] = 0
        end
        l[c] += 1
    end

    ans = 0

    for j in N:-1:1
        c = S[j]
        l[c] -= 1

        for (k, v) in r
            if haskey(l, k)
                ans += v * l[k]
            end
        end

        if !haskey(r, c)
            r[c] = 0
        end

        r[c] += 1

    end

    println(ans)

end

main()