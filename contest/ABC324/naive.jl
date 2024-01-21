function main()
    left = [1, 1, 2, 2, 2, 0, 2, 1, 1, 0]
    right = [0, 0, 2, 2, 2, 0, 2, 1, 0, 0]


    ans = 0

    for l in left
        for r in right
            if l + r >= 2
                ans += 1
            end
        end
    end

    @show ans
end

main()