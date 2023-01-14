function main()
    N = parse(Int, readline())
    result = 1
    for i in 2:N
        result += i
    end
    return result
end

println(main())