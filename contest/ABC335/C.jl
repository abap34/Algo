yesno(b::Bool) = (b ? "Yes" : "No") |> println

using DataStructures

const d_to_v = Dict(
    "R" => 1,
    "L" => -1,
    "U" => 0,
    "D" => 0,
)

const d_to_h = Dict(
    "U" => 1,
    "D" => -1,
    "R" => 0,
    "L" => 0,
)

function main()
    N, Q = parse.(Int, split(readline()))
    x = 1
    y = 0
    history = Tuple{Int, Int}[]
    for i in N:-1:1
        push!(history, (i, 0))
    end
    for _ in 1:Q
        q1, q2 = split(readline())
        q1 = parse(Int, q1)
        if q1 == 1
            x += d_to_v[q2]
            y += d_to_h[q2]
            push!(history, (x, y))
        else
            p = parse(Int, q2)
            _x, _y = history[end - p + 1]
            println("$_x $_y")
        end
    end
end

main()