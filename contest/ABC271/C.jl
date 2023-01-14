function main()
    N = parse(Int, readline())
    A = parse.(Int, split(readline()))
    D = Dict()
    surplus_count = 0
    books = Set(A)
    for a in A
        if haskey(D, a)
            D[a] += 1
            surplus_count += 1
        else
            D[a] = 1
        end
    end

    A_sorted = sort(A)
    current_del_ind = 1
    
    for i in 1:N
        if ((!(haskey(D, i))) || (D[i] < 1))
            if (((N - current_del_ind) == 0) || (N - current_del_ind - 1 == 0))
                return i - 1
            end
            if surplus_count > 0
                surplus_count += 1
            else
                if D[A_sorted[end-current_del_ind]] == 0
                    return i - 1
                else
                    D[A_sorted[end-current_del_ind]] -= 1
                end
                if D[A_sorted[end-current_del_ind-1]] == 0
                    return i - 1
                else
                    D[A_sorted[end-current_del_ind-1]] -= 1
                end
                current_del_ind += 2
            end
        else
            D[i] -= 1
        end
    end
end


println(main())