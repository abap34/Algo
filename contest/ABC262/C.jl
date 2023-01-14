function main()
    N = parse(Int, readline())
    A = parse.(Int, split(readline()))
    count_same = 0
    for i in 1:N
        if A[i] == i
            count_same += 1
        end
    end
    ans = 0
    ans += (count_same * (count_same - 1)) ÷ 2
    p = 0
    for i in 1:N
        j = A[i]
        if A[i] == i
            continue
        end
        if A[j] == i
            p += 1
        end
    end
    println(ans + p ÷ 2)
end


main()



