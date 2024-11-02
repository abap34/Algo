function main()
    A = parse.(Int, split(readline()))
    
    count = Dict{Int, Int}()
    for a in A
        count[a] = get(count, a, 0) + 1
    end

    ans = 0
    for (k, v) in count
        ans += v ÷ 2
    end

    println(ans)
end

main()