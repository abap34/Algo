parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function main()
    N = parseInt(readline())
    strs = Set{String}()
    S = []
    for _ in 1:N
        s = readline()
        push!(strs, s)
        push!(S, s)
    end

    for s in S
        if "!" * s in strs
            println(s)
            return 0
        end
    end

    println("satisfiable")
end

main()