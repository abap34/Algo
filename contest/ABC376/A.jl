function main()
    N, C = parse.(Int, split(readline()))
    T = parse.(Int, split(readline()))

    prev = T[1]
    ans = 1
    for i in 2:N
        if T[i] - prev >= C
            ans += 1
            prev = T[i]
        end
    end

    println(ans)
end

main()