function main()
    N = parse(Int, readline())

    table = zeros(Bool, 100, 100)

    for _ in 1:N
        a, b, c, d = parse.(Int, split(readline()))
        table[a+1:b, c+1:d] .= true
    end

    S = 0
    for i in 1:100
        for j in 1:100
            if table[i, j]
                S += 1
            end
        end
    end

    println(S)
end

main()