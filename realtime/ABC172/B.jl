parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

function main()
    count = 0
    S = chomp(readline())
    T = chomp(readline())
    for i in 1:length(S)
        if S[i] != T[i]
            count += 1
        end
    end

    println(count)
end

main()