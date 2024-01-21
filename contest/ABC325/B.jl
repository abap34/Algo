function main()
    N = parse(Int, readline())

    ok = zeros(Int, 24)
   
    for _ in 1:N
        w, x = parse.(Int, split(readline()))
        start = (9 + x) % 24 + 1
        finish = (17 + x) % 24 + 1


        if start < finish
            ok[start:finish] .+= w
        else
            ok[start:end] .+= w
            ok[begin:finish] .+= w
        end
    end


    println(maximum(ok))



end

main()