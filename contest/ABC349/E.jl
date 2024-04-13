const INF = 10^9

function win(board, v)
    for i in 1:3
        if all(board[i, :] .== v) || all(board[:, i] .== v)
            return true
        end
    end

    if all(board[i, i] == v for i in 1:3) || all(board[i, 4-i] == v for i in 1:3)
        return true
    end


    return false
end

function score(board, score_table)
    if win(board, 1)
        return INF
    elseif win(board, 2)
        return -INF
    end

    red_score = 0
    blue_score = 0


    for i in 1:3
        for j in 1:3
            if board[i, j] == 1
                red_score += score_table[i, j]
            elseif board[i, j] == 2
                blue_score += score_table[i, j]
            end
        end
    end

    return red_score - blue_score
end

function minmax(board, score_table, turn)
    if win(board, 1)
        return INF
    elseif win(board, 2)
        return -INF
    end

    if all(board .!= 0)
        return score(board, score_table)
    end

    if turn == 1
        max_score = -INF
        for i in 1:3
            for j in 1:3
                if board[i, j] == 0
                    board[i, j] = 1
                    max_score = max(max_score, minmax(board, score_table, 2))
                    board[i, j] = 0
                end
            end
        end

        return max_score
    end

    if turn == 2
        min_score = INF
        for i in 1:3
            for j in 1:3
                if board[i, j] == 0
                    board[i, j] = 2
                    min_score = min(min_score, minmax(board, score_table, 1))
                    board[i, j] = 0
                end
            end
        end

        return min_score
    end
end

function main()
    score_table = zeros(Int, (3, 3))
    score_table[1, :] = parse.(Int, split(readline()))
    score_table[2, :] = parse.(Int, split(readline()))
    score_table[3, :] = parse.(Int, split(readline()))


    board = zeros(Int, (3, 3))

    score = minmax(board, score_table, 1)

    score < 0 ? println("Aoki") : println("Takahashi") 



end

main()