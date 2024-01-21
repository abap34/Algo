yesno(b::Bool) = (b ? "Yes" : "No") |> println
function main()
    A, M, L, R = parse.(Int, split(readline()))
    
    
    A -= L
    R -= L  

    if A < 0
        A = A + (cld(-A, M) * M)
        if A > R
            return 0
        end
    end



    if A > R
        A = A - (cld((A - R), M) * M)
        if A < 0
            return 0
        end
    end


    S = 0
    
    S += A ÷ M

    S += (R - A) ÷ M

    S += 1

    return S
end


println(main())