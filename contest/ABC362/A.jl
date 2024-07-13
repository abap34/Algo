function main()
    R, G, B = parse.(Int, split(readline()))
    C = collect(readline())
    if join(C) == "Red"
        println(min(G, B))
    elseif join(C) == "Green"
        println(min(R, B))
    else
        println(min(R, G))
    end
end

main()