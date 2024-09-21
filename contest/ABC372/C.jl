function main()
    N, Q = parse.(Int, split(readline()))
    S = collect(readline())

    N_ABC = 0
    for i in 1:N-2
        if S[i] == 'A' && S[i+1] == 'B' && S[i+2] == 'C'
            N_ABC += 1
        end
    end

    function query!(X, C)
        # println("push $C at $X")
        if S[X] == C
            println(N_ABC)

            return
        end

        if X <= N - 2
            if (C == 'A') && (S[X+1] == 'B') && (S[X+2] == 'C')
                N_ABC += 1
                # println("plus at $X, $(X+1), $(X+2)")
            end
        end

        if 2 <= X <= N - 1
            if (S[X-1] == 'A') && (C == 'B') && (S[X+1] == 'C')
                N_ABC += 1
                # println("plus at $(X-1), $X, $(X+1)")
            end
        end

        if 3 <= X <= N
            if (S[X-2] == 'A') && (S[X-1] == 'B') && (C == 'C')
                N_ABC += 1
                # println("plus at $(X-1), $X, $(X+1)")
            end
        end

        if X <= N - 2
            if (S[X] == 'A') && (S[X+1] == 'B') && (S[X+2] == 'C')
                N_ABC -= 1
                # println("minus at $X, $(X+1), $(X+2)")
            end
        end

        if 2 <= X <= N - 1
            if (S[X-1] == 'A') && (S[X] == 'B') && (S[X+1] == 'C')
                N_ABC -= 1
                # println("minus at $(X-1), $X, $(X+1)")
            end
        end

        if 3 <= X <= N
            if (S[X-2] == 'A') && (S[X-1] == 'B') && (S[X] == 'C')
                N_ABC -= 1
                # println("minus at $(X-2), $(X-1), $X")
            end
        end

        S[X] = C

        println(N_ABC)
    end


    for _ in 1:Q
        X, C = split(readline())
        X = parse(Int, X)
        C = first(C)
        query!(X, C)
    end
end

main()