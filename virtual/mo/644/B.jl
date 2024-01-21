yesno(b::Bool) = (b ? "Yes" : "No") |> println
function main()
    S = collect(readline())
    drop_S = ['a', 'e', 'i', 'o', 'u']
    for s in S
        if !(s in drop_S)
            print(s)
        end
    end
    println()
end

main()