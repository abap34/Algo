yesno(b::Bool) = (b ? "Yes" : "No") |> println
function main()
    N, X = parse.(Int, split(readline()))
    S = parse.(Int, split(readline()))
    r = 0
    for s in S
        if s <= X
            r += s
        end
    end
    println(r)
end

main()