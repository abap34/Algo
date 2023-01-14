function solve(n2, n3, n4)
    ans = 0
    n6 = n3 ÷ 2
    @show n6
    if n6 > n4
        println("n6を全て使う。")
        ans += n4
        n6 -= n4
        n4 = 0
        if n2 > 2 * n6
            ans += n6
            n2 -= (2 * n6)       
            ans += n2 ÷ 5
        else
            ans += n2 ÷ 2
        end
    else
        ans += n6
        n6 = 0
        n4 -= n6
        n8 = n4 ÷ 2
        n4 = n4 % 2
        if n8 > n2
            ans += n2
        else
            ans += n8
            n2 -= n8
            ans += n2 ÷ 5
            if (n2 % 5 == 4) && (n4 == 1)
                ans += 1
            end
        end
    end
    return ans
end

function main()
    T = parse(Int, readline())
    results = []
    for i in 1:T
        n2, n3, n4 = parse.(Int, split(readline()))
        ans = solve(n2, n3, n4)
        push!(results, ans)
    end
    for ans in results
        println(ans)
    end
end

main()
