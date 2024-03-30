function main()
    S = collect(readline())

    _S = Set{String}()

    for i in eachindex(S)
        for j in i:length(S)
            push!(_S, join(S[i:j]))
        end
    end


    println(length(_S))
    

end

main()