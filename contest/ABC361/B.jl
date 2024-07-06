using IterTools

function solve(a, b, c, d, e, f, g, h, i, j, k, l)
    function isin(x, y, z)
        return a < x < d && b < y < e && c < z < f
    end

    ok = false
    
    coords = Iterators.product([g, j], [h, k], [i, l])

    for coord in coords
        x, y, z = coord
        if isin(x, y, z)
            ok = true
            break
        end
    end


    ok = ok || (a < g < d) && (b < h < e) && (l > f) && (i < c)

    b, c = c, b
    e, f = f, e
    h, i = i, h
    k, l = l, k

    ok = ok || (a < g < d) && (b < h < e) && (l > f) && (i < c)

    a, b = b, a
    d, e = e, d
    g, h = h, g
    j, k = k, j

    ok = ok || (a < g < d) && (b < h < e) && (l > f) && (i < c)
    return ok
end


function main()
    a, b, c, d, e, f = parse.(Int, split(readline()))
    g, h, i, j, k, l = parse.(Int, split(readline()))
    
    ok = solve(a, b, c, d, e, f, g, h, i, j, k, l) || solve(g, h, i, j, k, l, a, b, c, d, e, f)

    yesno(b::Bool) = (b ? "Yes" : "No") |> println

    yesno(ok)

end

main()