function main()
    B = parse(Int, readline())
    for i in 1:15
        if i^i == B
            return i
        end
    end
    return -1
end

println(main())