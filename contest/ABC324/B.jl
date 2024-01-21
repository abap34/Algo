function main()
    N = parse(Int, readline())
    x_max = floor(log(2, 10^18)) + 10
    y_max = floor(log(3, 10^18)) + 10 
    for x in 0:x_max
        for y in 0:y_max
            if 2^x * 3^y == N
                return "Yes"
            end
        end
    end

    return "No"
end

println(main())