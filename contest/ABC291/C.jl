function main(N, S)
    seen = Set{Tuple{Int, Int}}()
    x = 0
    y = 0
    push!(seen, (x, y))
    for s in S
        if s == 'R'
            x += 1
            ((x, y) in seen) && (return "Yes")
            push!(seen, (x, y))
        elseif s == 'L'
            x -= 1
            ((x, y) in seen) && (return "Yes")
            push!(seen, (x, y))
        elseif s == 'U'
            y += 1
            ((x, y) in seen) && (return "Yes")
            push!(seen, (x, y))
        elseif s == 'D'
            y -= 1
            ((x, y) in seen) && (return "Yes")
            push!(seen, (x, y))
        end
    end
    return "No"
end

N = parse.(Int, readline())
S = collect(readline())

println(main(N, S))