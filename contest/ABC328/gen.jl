yesno(b::Bool) = (b ? "Yes" : "No") |> println
function main()
    N = 2 * 10^5

    S = ""

    for i in 1:N
        r = rand(1:3)
        S *= r == 1 ? "A" : r == 2 ? "B" : "C"
    end

    println(S)
end

main()