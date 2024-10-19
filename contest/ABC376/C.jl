const DEBUG = false

function debug(args...)
    if DEBUG
        println(args...)
    end
end



function main()
    N = parse(Int, readline())
    toy = parse.(Int, split(readline()))
    box = parse.(Int, split(readline()))

    # if minimum(box) < minimum(toy)
    #     println(-1)
    #     return
    # end 


    function is_ok(x)
        debug("============")
        debug("x: ", x)
        toy_copy = copy(toy)
        box_copy = copy(box)

        push!(box_copy, x)
        sort!(toy_copy, rev=true)
        sort!(box_copy, rev=true)

        debug("toy_copy: ", toy_copy)
        debug("box_copy: ", box_copy)
        

        for i in 1:N    
            if toy_copy[i] > box_copy[i]
                return false
            end
        end

        return true
    end

    l = 1
    r = 10^10

    while r - l > 1
        m = (r + l) ÷ 2
        if is_ok(m)
            r = m
        else
            l = m
        end
    end


    for i in -10:10
        if is_ok(r + i)
            println(r + i)
            return
        end
    end

    println(-1)
end



main()