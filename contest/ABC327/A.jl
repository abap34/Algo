function main()
    N = parse(Int, readline())
    S = readline()
    return occursin("ab", S) || occursin("ba", S)
end

r = main()

if r
    println("Yes")
else
    println("No")
end