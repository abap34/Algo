function main()
    D = Dict{String, Int}()
    N = parse(Int, readline())
    for i in 1:N
        S = readline()
        if !(haskey(D, S))
            println(S)
            D[S] = 1
        else
            println("$S($(D[S]))")
            D[S] += 1
        end
    end
end

main()