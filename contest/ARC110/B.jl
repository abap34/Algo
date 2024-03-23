parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)




function main()
    N = parseInt(readline())
    T = readline()
    S = "110"^((N ÷ 3) * 2)
    len = 3 * 10^10

    if T == "1"
        return 2 * 10^10
    elseif T == "0"
        return 10^10
    end

    if T == "11"
        return 10^10
    elseif T == "00"
        return 0
    elseif T == "10"
        return 10^10
    elseif T == "01"
        return 10^10 - 1
    end


    if S[1:N] == T
        return ((len - N) ÷ 3) + 1
    elseif S[2:N+1] == T
        return ((len - 1 - N) ÷ 3) + 1
    elseif S[3:N+2] == T
        return ((len - 2 - N) ÷ 3) + 1
    else
        return 0
    end
end


println(main())