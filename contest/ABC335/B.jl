N = parse(Int, readline())

for i in 0:N
    for j in 0:N
        for k in 0:N
            if i + j + k <= N
                println("$i $j $k")
            end
        end
    end
end