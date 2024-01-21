function main()
    N, K = parse.(Int, split(readline()))
    S = collect(readline())
    n_pass = 0
    result = ""
    for i in 1:N
        if S[i] == 'o'
            n_pass += 1
            result *= "o"
        else
            result *= "x"
        end
        if n_pass == K
            result *= ("x"^(N-i))
            break
        end
    end
    return result
end


println(main())