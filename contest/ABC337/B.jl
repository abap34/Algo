yesno(b::Bool) = (b ? "Yes" : "No") |> println
function main()
    S = collect(readline())
    yesno(sort(S) == S)
end

main()