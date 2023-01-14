function main()
    N, S = parse.(Int, split(readline()))
    A = []
    B = []
    for i in 1:N
        a, b = parse.(Int, split(readline()))
        push!(A, a)
        push!(B, b)
    end
    if S - sum(B) > 0
        new_goal = S - sum(B)
        diff = A .- B

        table = zeros(Int, N, new_goal)

        log = fill("", N, new_goal)

        for i in 1:new_goal
            log[1, i] = "T"
        end
        

        table[1, diff[1]] = 1

        log[1, diff[1]] = "H"
        for i in 1:N
            log[i, N] = 
        for i in 2:N
            for j in 1:new_goal
                log[i, j] = log[i - 1, j] * "T"
            end
            for j in 1:new_goal
                if table[i - 1, j] == 1
                    table[i, j + diff[i]]  = 1
                    log[i, j + diff[i]] = log[i, j + diff[i]][1:end-1] * "H"
                end
            end
        end

        @show table
        @show log
        for i in 1:N
            if table[i, new_goal] == 1
                println("Yes")
                println(log[i, new_goal] * ("T" ^ (N - i)))
                return 0
            end
        end

        println("No")
    elseif S - sum(A) > 0
        new_goal = S - sum(A)
        diff = B .- A

        table = zeros(Int, N, new_goal)

        log = fill("", N, new_goal)

        for i in 1:new_goal
            log[1, i] = "H"
        end
        

        table[1, diff[1]] = 1
        log[1, diff[1]] = "T"

        for i in 2:N
            for j in 1:new_goal
                log[i, j] = log[i - 1, j] * "H"
            end
            for j in 1:new_goal
                if table[i - 1, j] == 1
                    table[i, j + diff[i]]  = 1
                    log[i, j + diff[i]] = log[i, j + diff[i]][1:end-1] * "T"
                end
            end
        end


        for i in 1:N
            if table[i, new_goal] == 1
                println("Yes")
                println(log[i, new_goal] * ("H" ^ (N - i)))
                return 0
            end
        end
        println("No")
    elseif sum(A) == S
        println("Yes")
        println("H" ^ N)
    elseif sum(B) == S
        println("Yes")
        println("T" ^ N)
    else
        println("No")
    end

end


main()
