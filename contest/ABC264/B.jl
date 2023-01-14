R, C = parse.(Int, split(readline()))

grid = zeros(15, 15)

grid[1, :] .= 1
grid[:, 1] .= 1
grid[15, :] .= 1
grid[:, 15] .= 1

grid[3:13, 3] .= 1
grid[3, 3:13] .= 1
grid[3:13, 13] .= 1
grid[13, 3:13] .= 1



grid[5:11, 5] .= 1
grid[5, 5:11] .= 1
grid[5:11, 11] .= 1
grid[11, 5:11] .= 1

grid[7:9, 7] .= 1
grid[7, 7:9] .= 1
grid[7:9, 9] .= 1
grid[9, 7:9] .= 1


if grid[R, C] == 1
    println("black")
else
    println("white")
end


