function main()
    N, D = parse.(Int, split(readline()))
    S = []
    for _ in 1:N
        s = collect(readline())
        push!(S, s)
    end

    if unique(unique.(S)) == [['x']]
        println(0)
        return 
    elseif unique(unique.(S)) == [['o']]
        println(D)
        return
    end

    ans = -1
    for start in 1:D
        ok = true
        r = 0
        for r in 0:D
            if (start + r == D)
                ans = max(r, ans)
                break
            end

            for s in S
                if (s[start + r] == 'x')
                    ok = false
                    break
                end
            end

            if !(ok)
                ans = max(r, ans)
                break
            end
        end
    end
    println(ans)
end

main()