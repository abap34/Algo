N, X, Y = parse.(Int, split(readline()))


function r_to_b(red, level)
    if level == 1
        return 0
    else
        ans = r_to_b(red, level - 1) + b_to_b(red * X, level)
        return ans
    end
end

function b_to_b(blue, level)
    if level == 1
        return blue
    else
        return r_to_b(blue, level - 1) + b_to_b(blue * Y, level - 1)
    end
end

function main(N, X, Y)
    (N == 1) && (return 0)
    return r_to_b(1, N)
end




println(main(N, X, Y))