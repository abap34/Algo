function main()
    S = collect(readline())
    res = ""
    for s in S
        if s == '0'
            res *= "1"
        elseif s == '1'
            res *= "0"
        else
            res *= s
        end
    end
    println(res)
end

main()