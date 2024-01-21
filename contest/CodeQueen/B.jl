function main()
    N = 120
    masu = fill(false, N, N)
    for i in 1:N-1
        r, c = parse.(Int, split(readline()))
        masu[r, c] = true
        masu[r, :] .= true
        masu[:, c] .= true
        directions = (
            (1, 1),
            (1, -1)
        )

        for direction in directions
            for __c in -5000:5000
                point = __c .* direction
                _r, _c = (r, c) .+ point
                if (1 <= _r <= N) && (1 <= _c<= N)
                    masu[_r, _c] = true
                end
            end
        end
    end
    # print_2d(masu)
    for i in 1:N
        for j in 1:N
            if !(masu[i, j])
                return (i, j)
            end
        end
    end
    return -1
end


function print_2d(mat)
    N, M = size(mat)
    for i in 1:N
        for j in 1:M
            print("$(Int(mat[i, j])) ")
        end
        println()
    end
end

result = main()
if result == -1
    println(-1)
else
    println("$(result[1]) $(result[2])")
end