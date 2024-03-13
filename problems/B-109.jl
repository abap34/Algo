parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function main()
    N = parseInt(readline())
    words = Set{String}()
    word = readline()
    push!(words, word)
    last_al = word[end]
    for i in 2:N
        word = readline()
        if word in words
            return "No"
        else
            if word[begin] == last_al
                push!(words, word)
                last_al = word[end]
            else
                return "No"
            end
        end
    end
    return "Yes"
end

println(main())
