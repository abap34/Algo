parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)


function main()
    S = [""]
    N = parseInt(readline())
    for i in 1:N
    	q = []
        for s in S
            push!(q, s * "a")
            push!(q, s * "b")
            push!(q, s * "c")
        end
        if i == N
            sort!(q)
            for s in q
                println(s)
            end
        else
            S = q
        end
    end
end

main()