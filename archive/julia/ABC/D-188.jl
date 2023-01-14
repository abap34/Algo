parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function main()
    N, C = parseMap(split(readline()))
    events = []
    for _ in 1:N
        a, b, c = parseMap(split(readline()))
        push!(events, (a - 1, +c))
        push!(events, (b, -c))
    end

    sort!(events)
    
    result = 0
    c = 0
    bef_time = 0
    for (time, v) in events
        if bef_time != time
            result += (time - bef_time) * min(c, C)
            bef_time = time
        end
        c += v
    end
    println(result)
end


main()