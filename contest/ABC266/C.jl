cross(x_a, y_a, x_b, y_b) = x_a * y_b - y_a * x_b

function main()
    A_x, A_y = parse.(Int, split(readline()))
    B_x, B_y = parse.(Int, split(readline()))
    C_x, C_y = parse.(Int, split(readline()))
    D_x, D_y = parse.(Int, split(readline()))

    if cross(B_x - A_x, B_y - A_y, C_x - B_x, C_y - B_y) < 0
        return "No"
    elseif cross(C_x - B_x, C_y - B_y, D_x - C_x, D_y- C_y) < 0
        return "No"
    elseif cross(D_x - C_x, D_y - C_y, A_x - D_x, A_y - D_y) < 0
        return "No"
    elseif cross(A_x - D_x, A_y - D_y, B_x - A_x, B_y - A_y) < 0
        return "No"
    end

    return "Yes"
end

println(main())