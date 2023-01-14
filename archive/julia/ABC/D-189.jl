parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)


function main()
    N = parseInt(readline())
    S = []
    for _ in 1:N
        s = readline()
        push!(S, s)
    end
    

    ans = 1
    for i in 1:N
        s = S[i]
        if s == "OR" 
            ans +=  2^i
        end
    end
    println(ans)


end


main()