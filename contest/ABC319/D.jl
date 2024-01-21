function ok(L, W, M)
    n_line = 1
    s = L[1]
    if maximum(L) > W
        return false
    end

    s += 1

    if s == W
        n_line += 1
        s = 0
    end

    for i in 2:length(L)
        l = L[i]
        if (s + l) > W
            n_line += 1
            s = l + 1
        elseif (s + l) == W
            n_line += 1
            s = 0
        else
            s += l 
            s += 1
        end
        
        if ((n_line > M) && (s > 0))
            return false
        end       
    end
    
    if n_line <= M
        return true
    elseif (n_line == (M + 1)) && (s == 0)
        return true
    else
        return false
    end
end


function main()
    N, M = parse.(Int, split(readline()))
    L = parse.(Int, split(readline()))
    left = 1
    right = 10^15
    mid = (left + right) ÷ 2
    while (right - left) != 1
        mid = (left + right) ÷ 2
        if ok(L, mid, M)
            right = mid
        else
            left = mid
        end
    end
    
    for i in mid-50:mid+50
        if ok(L, i, M)
            return i
        end
    end
end

println(main())