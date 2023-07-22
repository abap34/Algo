function main()
    N, M = parse.(Int, split(readline()))
    field = fill(' ', N, M)
    for i in 1:N
        field[i, :] = collect(readline())
    end
    start = (2, 2)

    stop = fill(false, N, M)
    route = fill(false, N, M)
    seen = Set{Tuple{Int, Int, Int,Int}}()
    for direction in ALL_DIRECTION
        search(start, direction, field, stop, route, seen)
    end

    

   println(sum(stop .| route))

    # vizviz(stop)
end

function viz(field)
    N, M = size(field)
    for i in 1:N
        for j in 1:M
            print("$(field[i,j]) ")
        end
        println()
    end
end

ALL_DIRECTION = (
    (0, 1),
    (1, 0),
    (-1, 0),
    (0, -1)
)

function vizviz(route)
    ne = (x -> x ? '#' : '_').(route)
    viz(ne)
end

function search(current, direction, field, stop, route, seen)
    push!(seen, (current..., direction...))
    route[current...] = true
    if field[(current .+ direction)...] == '#'
        stop[current...] = true
        route[current...] = true
        for _direction in ALL_DIRECTION
            if (!((current..., _direction...) in seen)) && (field[(current .+ _direction)...] != '#')
                search(current, _direction, field, stop, route, seen)
            end
        end
    else
        current = current .+ direction
        search(current, direction, field, stop, route, seen)
    end
end


main()