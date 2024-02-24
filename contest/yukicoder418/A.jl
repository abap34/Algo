function main()
    T = parse(Int, readline())
    for _ in 1:T
        D, A = parse.(Int, split(readline()))
        X = parse.(Int, split(readline()))
        for x in X
            print(round(Int, x // A, RoundNearestTiesAway), " ")
        end
        println()
    end
end

main()