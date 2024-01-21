yesno(b::Bool) = (b ? "Yes" : "No") |> println

function circle!(grid, init, d)
    N = size(grid)[1]

    # 上
    for i in d:N-d
        grid[d, i] = init
        init += 1
    end

    # 右
    for i in d:N-d
        grid[i, N-d+1] = init
        init += 1
    end

    # 下
    for i in N-d+1:-1:d+1
        grid[N-d+1, i] = init
        init += 1
    end

    # 左
    for i in N-d+1:-1:d+1
        grid[i, d] = init
        init += 1
    end

    return init
end

function out(grid)
    N = size(grid)[1]
    for i in 1:N
        for j in 1:N
            if i == j == ((N ÷ 2) + 1)
                print("T ")
            else
                print("$(grid[i, j]) ")
            end
        end
        println()
    end
end


function main()
    N = parse(Int, readline())
    grid = zeros(Int, (N, N))
    init = 1


    for d in 1:N÷2
        init = circle!(grid, init, d)
    end

    out(grid)

end

main()