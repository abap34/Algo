function main()
    l = [6, 28, 496, 8128, 33550336, 8589869056, 137438691328,
        2305843008139952128,
        big"2658455991569831744654692615953842176",
        big"191561942608236107294793378084303638130997321548169216"]

    N = parse(BigInt, readline())

    yesno(b::Bool) = (b ? "Yes" : "No") |> println

    yesno(N in l)
end

main()