parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)


function main()
    N = parseInt(readline())
    S = []
    for i in 1:N
        s = readline()
        push!(S, s)
    end

    reverse!(S)
    arr = []
    for s in S
        if s == "AND"
            push!(arr, 1)
        else
            push!(arr, 2)
            
end

main()