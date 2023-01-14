parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function main()
    N = parseInt(readline())
    Points = []
    for i in 1:N
        x, y = parseMap(split(readline()))
        push!(Points, (x, y))
    end

    #ABCが同一直線状 <=> AB, ACの傾き一致

    for i in 1:N
        for j in i+1:N
            for k in j+1:N
                watch_pair = [Points[i], Points[j], Points[k]]
                sort!(watch_pair)
                #@show watch_pair
                abk = (watch_pair[1][2] - watch_pair[2][2]) // (watch_pair[1][1] - watch_pair[2][1]) 
                ack = (watch_pair[1][2] - watch_pair[3][2]) // (watch_pair[1][1] - watch_pair[3][1])
                #@show abk
                #@show ack
                if abk == ack
                    return "Yes"
                end
            end
        end
    end 
    return "No"
end

println(main())