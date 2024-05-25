function main()
    A, B = parse.(Int, split(readline()))
    targets = [1, 2, 3]
    deleteat!(targets, findall(x -> x == B, targets)[1])
    if A in targets
        for t in targets
            if t != A
                println(t)
                return
            end
        end
    else
        println(-1)
    end
end

main()