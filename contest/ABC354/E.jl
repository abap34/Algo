DEBUG = false


function debug(args...)
    if DEBUG
        println(args...)
    end
end


# ((A, B), 先手?) -> 先手の勝ちか?
memo = Dict{
    Tuple{Vector{Tuple{Int, Int}}, Bool}, Bool
}()


function finish(cards)
    N = length(cards)
    for i in 1:N
        for j in i+1:N
            if cards[i][1] == cards[j][1] || cards[i][2] == cards[j][2]
                return false
            end
        end
    end


    return true
end

function minmax(cards, turn, depth=0)
    if haskey(memo, (cards, turn))
        return memo[(cards, turn)]
    end

    if finish(cards)
        debug(" "^depth, turn ? "Aoki" : "Takahashi", " の勝ち")
        return !turn
    end

    N = length(cards)


    if turn
        res = false
        for i in 1:N
            for j in i+1:N
                if cards[i][1] == cards[j][1] || cards[i][2] == cards[j][2]
                    debug(
                        " "^depth, "$i <-> $j を削除して次のターンに進む"
                    )
                    new_cards = copy(cards)
                    deleteat!(new_cards, j)
                    deleteat!(new_cards, i)
                    debug(
                        " "^depth, "new_cards: ", new_cards
                    )
                    res = res || minmax(new_cards, !turn, depth+1)
                end
            end
        end
        memo[(cards, turn)] = res
        return res
    else
        res = true
        for i in 1:N
            for j in i+1:N
                new_cards = copy(cards)
                if cards[i][1] == cards[j][1] || cards[i][2] == cards[j][2]
                    debug(
                        " "^depth, "$i <-> $j を削除して次のターンに進む"
                    )
                    new_cards = copy(cards)
                    deleteat!(new_cards, j)
                    deleteat!(new_cards, i)
                    debug(
                        " "^depth, "new_cards: ", new_cards
                    )
                    res = res && minmax(new_cards, !turn, depth+1)
                end
            end
        end
        memo[(cards, turn)] = res
        return res
    end
end


function main()
    N = parse(Int, readline())
    A = Int[]
    B = Int[]
    for _ in 1:N
        a, b = split(readline())
        push!(A, parse(Int, a))
        push!(B, parse(Int, b))
    end

    cards = [(A[i], B[i]) for i in 1:N]

    println(minmax(cards, true) ? "Takahashi" : "Aoki")
end

main()
