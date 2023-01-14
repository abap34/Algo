function main()
    l = zeros(10000)

    L1, R1, L2, R2 = parse.(Int, split(readline()))

    l[L1+1:R1+1] .+= 1
    l[L2+1:R2+1] .+= 1

    ans = 0
    for ll in l
        if ll == 2
            ans += 1
        end
    end

    if ans > 0
        println(ans - 1)
    else
        println(ans)
    end
end

main()