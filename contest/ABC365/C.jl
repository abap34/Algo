
function main()
    N, M = parse.(Int, split(readline()))
    A = parse.(Int, split(readline()))
    
    if sum(A) <= M
        println("infinite")
        return
    end

    function is_ok(x)
        t = 0
        for a in A
            t += min(a, x)
        end
        return t <= M
    end

    ng = 0
    ok = 10^15 + 1

    while abs(ok - ng) > 1
        mid = (ok + ng) ÷ 2
        if is_ok(mid)
            ng = mid
        else
            ok = mid
        end
    end

    println(ng)

end

main()