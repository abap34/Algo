yesno(b::Bool) = (b ? "Yes" : "No") |> println
function main()
    N = parse(Int, readline())
    t = 0
    a = 0
    for _ in 1:N
        x, y = parse.(Int, split(readline()))
        t += x
        a += y
    end

    if t > a
        println("Takahashi")
    elseif t < a
        println("Aoki")
    else
        println("Draw")
    end
end

main()