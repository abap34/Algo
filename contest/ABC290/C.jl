function main()
    N, K = parse.(Int, split(readline()))
    A = parse.(Int, split(readline()))
    sort!(unique!(A))
    streak = 1
    
    if A[1] != 0
        return 0
    end

    if length(A) == 1 || K == 1
        if A[1] == 0
            return 1
        else
            return 0
        end
    end

    if length(A) == 2 && K > 1
        if A == [0, 1]
            return 2
        elseif A[1] == 0
            return 1
        else
            return 0
        end
    end

    for i in 1:length(A)-1
        if A[i+1] == A[i] + 1
            streak += 1
            if streak == K
                return K
            end
        else
            return streak
        end
    end
    return streak
end


println(main())