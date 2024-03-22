function main()
    S = collect(readline())
    if S[1] != '<'
        return false
    end

    if S[end] != '>'
        return false
    end

    if !('=' in S)
        return false
    end 

    if all(x -> x == '=', S[2:end-1])
        return true
    end

    return false
end

result = main()

if result
    println("Yes")
else
    println("No")
end