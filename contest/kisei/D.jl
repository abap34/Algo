function d(xy1, xy2)
    x1, y1 = xy1
    x2, y2 = xy2
    return sqrt((x1 - x2)^2 + (y1 - y2)^2)
end


function main()
    xa, ya, xb, yb, T, V = parse.(Int, split(readline()))
    N = parse(Int, readline())
    for i in 1:N
        x, y = parse.(Int, split(readline()))
        all_d = d((xa, ya), (x, y)) + d((x, y), (xb, yb))
        if all_d <= (T * V)
            return "YES"
        end
    end
    return "NO"
end

println(main())
