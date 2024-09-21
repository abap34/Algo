function main()
    S = collect(readline())
    S = filter(x -> x != '.', S)
    println(join(S))
end

main()