function main()
    S = chomp(readline())
    zs = 0
    os = 0
    for i in 1:length(S)
        s = S[i]
        if i % 2 == 0
            if s == '0'
                zs += 1
            else
                os += 1
            end
        else
            if s == '1'
                zs += 1
            else
                os += 1
            end
        end
    end
    println(min(os, zs))
end

main()