function main()
    N, K, X = parse.(Int, split(readline()))
    A = parse.(Int, split(readline()))
    insert!(A, K+1, X)
    for a in A
       print("$a ")
    end
    println()
end

main()