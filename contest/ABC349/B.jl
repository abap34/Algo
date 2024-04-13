function main()
    S = collect(readline())
    d = Dict{Char, Int}()

    for s in S
        if s in keys(d)
            d[s] += 1
        else
            d[s] = 1
        end
    end

    counts = zeros(Int, length(S))

    for (key, value) in d
        counts[value] += 1
    end

    for c in counts
        if (c == 0) || (c == 2)
            continue
        else
            return false
        end
    end

    return true
end

yesno(b::Bool) = (b ? "Yes" : "No") |> println

yesno(main())