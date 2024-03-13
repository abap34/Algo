yesno(b::Bool) = (b ? "Yes" : "No") |> println


function isintersection(x1, y1, x2, y2, X1, Y1, X2, Y2)::Bool
    if x1 == x2
        if X1 == X2
            return x1 == X1
        else
            m = (Y2 - Y1) / (X2 - X1)
            c = Y1 - m * X1
            y = m * x1 + c
            return (Y1 <= y <= Y2) || (Y2 <= y <= Y1)
        end
    elseif X1 == X2
        m = (y2 - y1) / (x2 - x1)
        c = y1 - m * x1
        y = m * X1 + c
        return (y1 <= y <= y2) || (y2 <= y <= y1)
    else
        m1 = (y2 - y1) / (x2 - x1)
        c1 = y1 - m1 * x1
        m2 = (Y2 - Y1) / (X2 - X1)
        c2 = Y1 - m2 * X1
        if m1 == m2
            return c1 == c2
        else
            x = (c2 - c1) / (m1 - m2)
            y = m1 * x + c1
            return (x1 <= x <= x2) && (X1 <= x <= X2) && (y1 <= y <= y2) && (Y1 <= y <= Y2)
        end
    end
end


    

function main()
    T = parse(Int, readline())
    for _ in 1:T
        x1, y1, x2, y2, X1, Y1, X2, Y2 = parse.(Int, split(readline()))
        yesno(isintersection(x1, y1, x2, y2, X1, Y1, X2, Y2))        
    end
end

main()

