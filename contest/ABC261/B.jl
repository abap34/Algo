function main()
    N = parse(Int, readline())
    table = []
    for i in 1:N
        A = collect(readline())
        push!(table, A)
    end
    for i in 1:N
        for j in 1:N
            if table[i][j] == 'W'
                if table[j][i] != 'L'
                    return "incorrect"
                end
            elseif table[i][j] == 'L'
                if table[j][i] != 'W'
                    return "incorrect"
                end
            elseif table[i][j] == 'D'
                if table[j][i] != 'D'
                    return "incorrect"
                end
            end
        end
    end
    return "correct"
end

println(main())
