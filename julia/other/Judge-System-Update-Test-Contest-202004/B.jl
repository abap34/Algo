parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function main()
    N = parseInt(readline())
    R_arr = []
    B_arr = []
    for _ in 1:N
        X,C = split(readline())
        X = parseInt(X)
        if C == "R"
            push!(R_arr,X)
        else
            push!(B_arr,X)
        end
    end
    sort!(R_arr)
    sort!(B_arr)
    for r in R_arr
        println(r)
    end
    for b in B_arr
        println(b)
    end
end


main()