function ndiv(n)
    r = 0
    while (n % 2) == 0
        n = n ÷ 2
        r += 1
    end

    return r
end




function solve(l, r, results)
    if l > r
        return false
    end

    if r - l <= 1
        return true
    end

    max_base = ndiv(r)

    for i in max_base:-1:0
        push!(results, r - 2^i)
        if solve(l, r - 2^i, results)
            return true
        else
            pop!(results)
        end
    end


    return false
end



function main()
    l, r = parse.(Int, split(readline()))
    results = [r]
    solve(l, r, results)

    push!(results, l)

    unique!(results)

    sort!(results)


    println(length(results) - 1)

    for i in 1:length(results)-1
        println("$(results[i]) $(results[i+1])")
    end


end

main()