function main()
    T = parse(Int, readline())
    for _ in 1:T
        N = parse(Int, readline())
        A = parse.(Int, split(readline()))
        max_diff = -1000
        for i in 1:N-1
            diff = A[i] - A[i+1]
            if diff > max_diff
                max_diff = diff
            end
        end


        if max_diff < 0
            println(0)
        else
            println(max_diff + 1)
        end
    end
end

main()