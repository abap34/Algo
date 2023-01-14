function main()
    N = parse(Int, readline())
    T = []
    times_d = Dict{Int, Int}()
    big_d = Dict{Int, Int}()
    base = 0
    for i in 1:N
        t, x, a = parse.(Int, split(readline()))
        if x == 0
            continue
        else
            t = t * 120 ÷ x
        end
        if haskey(times_d, t)
            times_d[t] += 1
            big_d[t] += a
        else
            times_d[t] = 1
            big_d[t] = a
        end
    end
    max_value = -1
    max_key = -1
    for (key, value) in times_d
        if value > max_value
            max_key = key
            max_value =  value
        end
    end

    println(base + big_d[max_key])
end

main()

