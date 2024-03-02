function iscube(n)
    x = round(Int, cbrt(n))
    return x^3 == n
end

function iskaibun(n)
    s = string(n)
    return s == reverse(s)
end


function main()
    N = parse(Int, readline())
    for x in 10^6+1:-1:1
        t = x^3
        if (t <= N) && iskaibun(t)
            println(t)
            return
        end 
    end

end

main()