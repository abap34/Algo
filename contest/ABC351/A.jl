function main()
    A = parse.(Int, split(readline()))
    B = parse.(Int, split(readline()))
    println(sum(A) - sum(B) + 1)
end

main()