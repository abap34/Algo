function main()
    N, M = parse.(Int, split(readline()))
    A = parse.(Int, split(readline()))
    ans_table = zeros(Int, M + 1)


    for a in A
        ans_table[a + 1] += 1
    end
    
    people_max_ans = maximum(ans_table)

    if people_max_ans < (N ÷ 2 + 1)
        return "?"
    end
    
    n_cand = 0

    for a in ans_table
        if a == people_max_ans
            n_cand += 1
        end
    end

    if n_cand > 1
        return "?"
    end

    ans = findall(x -> x == people_max_ans, ans_table)[1] - 1
    
    return ans

end

println(main())