yesno(b::Bool) = (b ? "Yes" : "No") |> println
function main()
    N = parse(Int, readline())
    A = parse(Int, readline())

    yesno(N % 500 <= A)
end

main()