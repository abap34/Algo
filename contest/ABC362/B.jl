using LinearAlgebra

function main()
    xa, ya = parse.(Int, split(readline()))
    xb, yb = parse.(Int, split(readline()))
    xc, yc = parse.(Int, split(readline()))

    v1 = [xb - xa, yb - ya]
    v2 = [xc - xa, yc - ya]
    v3 = [xc - xb, yc - yb]

    if dot(v1, v2) == 0 || dot(v1, v3) == 0 || dot(v2, v3) == 0
        println("Yes")
    else
        println("No")
    end
end

main()