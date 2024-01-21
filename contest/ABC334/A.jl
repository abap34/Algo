yesno(b::Bool) = (b ? "Yes" : "No") |> println
function main()
    a, b = parse.(Int, split(readline()))
    if a > b
        println("Bat")
    else
        println("Glove")
    end
end

main()