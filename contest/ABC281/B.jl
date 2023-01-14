function main()
    S = readline()
    first = S[1]
    en = S[end]
    med = S[2:end-1]
    if !(first in 'A':'Z')
        return false
    end

    if !(en in 'A':'Z')
        return false
    end

    if length(med) != 6
        return false
    end

    if med[1] == '0'
        return false
    end

    for m in med
        if !(m in '0':'9')
            return false
        end
    end

    return true
end

if main()
    println("Yes")
else
    println("No")
end