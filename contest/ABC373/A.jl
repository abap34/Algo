function main()
    S = []
    for i in 1:12
        push!(S, collect(readline()))
    end

    ans = 0
    for i in 1:12
        if length(S[i]) == i
            ans += 1
        end
    end

    println(ans)
end

main()