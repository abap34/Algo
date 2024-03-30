yesno(b::Bool) = (b ? "Yes" : "No") |> println


function main()
    N, A, B = parse.(Int, split(readline()))
    D = parse.(Int, split(readline()))

    ok = true

    for i in N:-1:1
        w = D[i]

        idx = i == 1 ? N : i - 1
        
        
        p = D[idx] 
    
        offset = (A + B) - (w % (A + B)) + 1

        # println("$w 日後を先頭に持ってくるには $offset 日からスタート")
        # println("このとき右端になるのは $idx 番目の $p")
        # println("これは $((p + offset) % (A + B)) 日目")


        if (p + offset) % (A + B) < A
            yesno(true)
            return
        end

        # println("==================")
    end


    yesno(false)
end

main()