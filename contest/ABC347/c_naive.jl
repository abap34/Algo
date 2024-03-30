yesno(b::Bool) = (b ? "Yes" : "No") |> println

function naive(N, A, B, D)
    for i in 0:A+B+1
        ok = true
        for d in D
            _d = (i + d) % (A + B)
            _d = (_d == 0 ? A + B : _d)

            if !(1 <= _d <= A)
                ok = false
                break
            end
        end

        if ok
            return true
        end
    end

    return false
end


function solve(N, A, B, D)
    for i in N:-1:1
        w = D[i]

        idx = i == 1 ? N : i - 1
        
        p = D[idx] 
    
        offset = (A + B) - (w % (A + B)) + 1


        # println("$w 日後を先頭に持ってくるには $offset 日からスタート")
        # println("このとき右端になるのは $idx 番目の $p")
        # println("これは $(((w - p) + offset) % (A + B)) 日目")


        if ((w - p) + offset) % (A + B) < A
            return true
        end


    end


    # println("------------------------")
    return false
end

function main()
    # N, A, B = parse.(Int, split(readline()))
    # D = parse.(Int, split(readline()))

    # @show solve(N, A, B, copy(D))
    # @show naive(N, A, B, D)

    N = 2

    A = 3
    B = 2

    for i in 1:1000, j in i+1:100
        if solve(N, A, B, [i, j]) != naive(N, A, B, [i, j])
            @show (i, j), solve(N, A, B, [i, j]), naive(N, A, B, [i, j])
            break
        end
    end
end

main()