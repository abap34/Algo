function main()
    N = readline()
    A = parse.(Int, split(readline()))

    if length(unique(A)) == 1
        println("Yes")
    else
        println("No")
    end
end

main()