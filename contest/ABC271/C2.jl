function main()
    N = parse(Int, readline())
    A = parse.(Int, split(readline()))
    surplus_count = 0
    books = Set(A)
    A_sorted = sort(A)
    D = Dict()
    for a in A
        if haskey(D, a)
            D[a] += 1
            surplus_count += 1
        else
            D[a] = 1
        end
    end
    current_del_ind = 0 
    if N == 1
        if A[1] == 1
            return 1
        else
            return 0
        end
    end 
    if N == 2
        if A_sorted[1] == 1
            if A_sorted[2] == 2
                return 2
            else
                return 1
            end
        else
            return 1
        end
    end
    max_ans = 3 * 10^5
    for i in 1:max_ans
        if !(i in books)     
            if isempty(books) && (surplus_count == 0)
                return i - 1
            end
            if surplus_count >= 2
                surplus_count -= 2
            elseif surplus_count == 1
                surplus_count = 0
                pop!(books, A_sorted[end-current_del_ind])
                current_del_ind += 1
            else
                pop!(books, A_sorted[end-current_del_ind])
                if A_sorted[end-current_del_ind-1] in books
                    pop!(books, A_sorted[end-current_del_ind-1])
                else
                    return i - 1
                end
                current_del_ind += 2
            end
        else
            pop!(books, i)
        end
    end
    return max_ans
end


println(main())