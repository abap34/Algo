function main()
    H1, W1 = parse.(Int, split(readline()))
    A = zeros(H1, W1)
    for i in 1:H1
        A_row = parse.(Int, split(readline()))
        A[i, :] .= A_row
    end

    H2, W2 = parse.(Int, split(readline()))
    B = zeros(H2, W2)
    for i in 1:H2
        B_row = parse.(Int, split(readline()))
        B[i, :] .= B_row
    end

    if H1 < H2 || W1 < W2
        return "No"
    end

    n_del_row = H1 - H2
    n_del_col = W1 - W2

    for i in 0:(2^H1)-1
        pettern_row = digits(i, base=2, pad=H1)
        if count(x->x==0, pettern_row) != n_del_row
            continue
        else
            for j in 0:(2^W1) - 1
                pettern_col = digits(j, base=2, pad=W1)
                if count(x->x==0, pettern_col) != n_del_col
                    continue
                else
                    if A[pettern_row .== 1, pettern_col .== 1] == B
                        return "Yes"
                    end
                end
            end
        end
    end
    return "No"
end

println(main())