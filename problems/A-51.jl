parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function distance(x1, y1, x2, y2)
    return (abs(x1 - x2)^2) + (abs(y1 - y2)^2)    
end

function inCircle(x1, x2, r, x2, x3, y2, y3)
    return distance(x1, y1, x2, y2) <= r^2 && distance(x1, y1, x2, y3) <= r^2 && distance(x1, y1, x3, y3) <= r^2 && distance(x1, y1, x3, y3) <= r^2
end


function inSquare(x1, x2, r, x2, x3, y2, y3)
    return y2 <= (y1 - r) && (y1 + r) <= y3  && x2 <= (x1 - r) && (x1 + r) <= x3
end

function main()
    x1, y1, r = parseMap(split(readline()))
    x2, y2, x3, y3 = parseMap(split(readline()))
    if inSquare(x1, x2, r, x2, x3, y2, y3)
        println("NO")
        println("YES")
    elseif inCircle(x1, x2, r, x2, x3, y2, y3)
        println("YES")
        println("NO")
    else
        println("YES")
        println("YES")
    end     
end