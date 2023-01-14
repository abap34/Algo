parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)
const INF = 10000000000

struct Point
    x :: Int
    y :: Int
end


function Base.isless(a::Point, b::Point)
    return (a.x < b.x) && (a.y < b.y)
end

function distance(a::Point, b::Point)
    return (a.x - b.x)^2 + (a.y - b.y^2)
end

function main()
    N = parseInt(readline())
    reds = Array{Point, 1}(undef, N)
    blues = Array{Point, 1}(undef, N)
    
    ans = 0

    for i in 1:N
        x, y = parseMap(split(readline()))
        reds[i] = Point(x, y)
    end
    for i in 1:N
        x, y = parseMap(split(readline()))
        blues[i] = Point(x, y)
    end
    
    sort!(reds)
    sort!(blues)

    for (i, red) in enumerate(reds)
        for (j, blue) in enumerate(blues)
            if red < blue
                reds[i] = Point(-1, -1)
                blues[j] = Point(-1, -1)
                 
    for (i, red) in enumerate(reds)
        if red < blues[i]
            # println(red, ":", blues[i])
        else
            return i - 1
        end
    end
    return N
end



println(main())