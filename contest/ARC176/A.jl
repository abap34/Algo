DEBUG = false

mutable struct Idx
    row::Int
    col::Int
end


function fillit(N, one_idxs)
    mat = zeros(Int, (N, N))
    for idx in one_idxs
        row, col = idx.row, idx.col
        mat[row, col] = 1
    end

    return mat
end

function main()
    N, M = parse.(Int, split(readline()))

    A = Int[]
    B = Int[]
    for _ in 1:M
        a, b = parse.(Int, split(readline()))
        push!(A, a)
        push!(B, b)
    end

    one_idxs = Idx[]

    row_to_oneidxs = Dict{Int,Set{Int}}()
    col_to_oneidxs = Dict{Int,Set{Int}}()

    for i in 1:N
        row_to_oneidxs[i] = Set{Int}()
        col_to_oneidxs[i] = Set{Int}()
    end


    for row in 1:N
        start_idx = row
        en_idx = min(row + M - 1, N)
        for i in start_idx:en_idx
            push!(one_idxs, Idx(row, i))
        end

        start_idx = 1
        en_idx = (row + M - 1) - N

        for i in start_idx:en_idx
            push!(one_idxs, Idx(row, i))
        end
    end


    for idx in one_idxs
        row, col = idx.row, idx.col
        push!(row_to_oneidxs[row], col)
        push!(col_to_oneidxs[col], row)
    end


    (DEBUG) && println("init")
    (DEBUG) && (fillit(N, one_idxs) |> display)
    (DEBUG) && (println("================================="))

    # 条件を満たすように行を入れ替える
    # 条件を満たすために swap した後にそこは固定. 
    locked_row = fill(false, N)
    locked_col = fill(false, N)

    solved = Set{Tuple{Int,Int}}()

    # ここから swap
    for i in 1:M
        a, b = A[i], B[i]

        (DEBUG) && (println("==============================="))
        (DEBUG) && (println("try to solve ($a, $b)"))
        (DEBUG) && (println("==============================="))

        skip = false
        for idx in one_idxs
            if (a == idx.row) && (b == idx.col)
                (DEBUG) && println("($a, $b) in one_idxs. No Need to swap")
                skip = true
                locked_row[a] = true
                locked_col[b] = true

                push!(solved, (a, b))
            end
        end


        (skip) && (continue)

        # (a, b) を 1 にするために
        # b列目 が 1になってるものを探して、 swap する. 
        swap_row = -1

        # 対象を探す
        for idx in one_idxs
            row, col = idx.row, idx.col
            # 一致していて、かつその行がロックされていないか？

            # if (col == b) && !(locked_row[row]) && !(locked_row[a])
            if (col == b)
                # swap することで 他の埋めたいところが壊れないか？  
                # swap 先の行の 1 の idx
                one_idx = row_to_oneidxs[a]

                ok = true

                # すでに解決済みのやつが壊れないかチェック
                for idx in solved
                    (DEBUG) && (println("check $idx"))
                    other_row, other_col = idx
                    if (other_row == row) || (other_row == a) 
                        # 壊れる
                        (DEBUG) && (println("target to check"))
                        (DEBUG) && (@show one_idx)
                        if !(other_col in one_idx)
                            ok = false
                        end
                    end
                end


                if ok
                    swap_row = row
                    push!(solved, (a, b))
                    break
                end


            end
        end


        if swap_row != -1
            row_to_oneidxs[a], row_to_oneidxs[swap_row] = row_to_oneidxs[swap_row], row_to_oneidxs[a]

            (DEBUG) && (println("To fill ($a, $b) swap row: $a <-> $swap_row"))


            (DEBUG) && (fillit(N, one_idxs) |> display)


            (DEBUG) && (println("     ↓   "))
            for idx in one_idxs
                row, _ = idx.row, idx.col

                if row == swap_row
                    idx.row = a
                    continue
                end


                if row == a
                    idx.row = swap_row
                    continue
                end
            end
            locked_row[a] = true
            locked_row[swap_row] = true

            (DEBUG) && (fillit(N, one_idxs) |> display)
            continue
        end

        # 列の swap 
        swap_col = -1

        (DEBUG) && (println("try to swap col."))

        for idx in one_idxs
            row, col = idx.row, idx.col
            # 一致していて、かつその行がロックされていなければそこで swap
            # if (row == a) && !(locked_col[col]) && !(locked_col[b])
            if (row == a)
                # swap することで 他の埋めたいところが壊れないか？  

                # swap 先の行の 1 の idx
                one_idx = col_to_oneidxs[b]

                ok = true

                # すでに解決済みのやつが壊れないかチェック
                for idx in solved
                    other_row, other_col = idx
                    # swap によって影響を受ける
                    if (other_col == col) || (other_col == b) 
                        # 壊れる
                        if !(other_row in one_idx)
                            ok = false
                        end
                    end
                end


                if ok
                    swap_row = row
                    push!(solved, (a, b))
                    break
                end

            end
        end

        if swap_col != -1
            col_to_oneidxs[a], col_to_oneidxs[swap_col] = col_to_oneidxs[swap_col], col_to_oneidxs[a]


            (DEBUG) && (println("To fill ($a, $b)  swap col: $b <-> $swap_col"))

            (DEBUG) && (fillit(N, one_idxs) |> display)


            (DEBUG) && (println("     ↓   "))
            for idx in one_idxs
                _, col = idx.row, idx.col

                if col == swap_col
                    idx.col = b
                    continue
                end


                if col == b
                    idx.col = swap_col
                    continue
                end
            end
            locked_col[b] = true
            locked_col[swap_col] = true


            (DEBUG) && (fillit(N, one_idxs) |> display)
        else
            @assert false
        end

    end

    if DEBUG
        mat = zeros(Int, (N, N))
        for idx in one_idxs
            mat[idx.row, idx.col] = 1
        end

        display(mat)

        @show sum(mat, dims=2)
        @show sum(mat, dims=1)

        for i in 1:M
            a, b = A[i], B[i]
            @show a, b
            @show mat[a, b]
            @assert mat[a, b] == 1
        end
    end


    row_sum = zeros(Int, N)
    col_sum = zeros(Int, N)

    for idx in one_idxs
        row, col = idx.row, idx.col
        row_sum[row] += 1
        col_sum[col] += 1
    end

    @assert all(x -> x == M, row_sum)
    @assert all(x -> x == M, col_sum)

    println(length(one_idxs))

    for idx in one_idxs
        println("$(idx.row) $(idx.col)")
    end
end

main()