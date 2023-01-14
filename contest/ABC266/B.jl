function main()
    N = parse(Int, readline())
    M = 998244353 
    m = N % M
    if m >= 0
        println(m)
    else
        println(M + m)
    end
end


main()