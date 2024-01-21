using Dates
using Random

Random.seed!(34)


mutable struct Timer
    timeout::Millisecond
    created::DateTime
end

function Timer(timeout_ms::Int)
    return Timer(Millisecond(timeout_ms), Dates.now())
end


function is_timeout(x::Timer)
    now_time = Dates.now()
    elapsed_time = now_time - x.created
    return elapsed_time >= x.timeout
end


function reset!(x::Timer)
    x.created = Dates.now()
end


function rate(x::Timer)
    now_time = Dates.now()
    elapsed_time = now_time - x.created
    return x.timeout / elapsed_time
end


function read_input()
    N = parse(Int, readline())

    h = zeros(Bool, (N - 1, N))
    v = zeros(Bool, (N, N - 1))
    d = zeros(Int, (N, N))

    for i in 1:N-1
        h[i, :] .= parse.(Bool, collect(readline()))
    end

    for i in 1:N
        v[i, :] .= parse.(Bool, collect(readline()))
    end

    for i in 1:N
        d[i, :] .= parse.(Int, split(readline()))
    end

    return N, h, v, d
end




const DIRECTION_TO_NAMES = Dict(
    (0, 1) => 'R',
    (1, 0) => 'D',
    (0, -1) => 'L',
    (-1, 0) => 'U'
)

function reverse(direction::Char)
    if direction == 'R'
        return 'L'
    elseif direction == 'L'
        return 'R'
    elseif direction == 'U'
        return 'D'
    elseif direction == 'D'
        return 'U'
    end
end


function reverse(direction::Tuple{Int,Int})
    if direction == (0, 1)
        return (0, -1)
    elseif direction == (0, -1)
        return (0, 1)
    elseif direction == (1, 0)
        return (-1, 0)
    elseif direction == (-1, 0)
        return (1, 0)
    end
end

function output(route::Vector{Tuple{Int,Int}})
    for i in eachindex(route)
        print(DIRECTION_TO_NAMES[route[i]])
    end
end


const DIRECTIONS_BACK = [
    (0, -1),
    (-1, 0),
    (0, 1),
    (1, 0)
]


function back_home(i, j, route::Vector{Tuple{Int,Int}}, visited)
    if i == 1 && j == 1
        # output(route)
        return true
    end

    visited[i, j] = true

    for (di, dj) in DIRECTIONS_BACK
        if ok(i, j, di, dj, visited)
            push!(route, (di, dj))
            (back_home(i + di, j + dj, route, visited)) && (break)
            pop!(route)
        end
    end

    return false
end


function ok(i, j, di, dj, visited)
    if i + di < 1 || i + di > N || j + dj < 1 || j + dj > N
        return false
    end

    if visited[i+di, j+dj]
        return false
    end

    if di == 0
        if dj == 1  # (0, 1)
            return !v[i, j]
        else        # (0, -1)
            return !v[i, j-1]
        end
    else
        if di == 1  # (0, 1)
            return !h[i, j]
        else        # (0, -1)
            return !h[i-1, j]
        end
    end

    return true
end


n_visited::Int = 0
const N, h, v, d = read_input()



DIRECTIONS = [
    (0, 1),
    (1, 0),
    (0, -1),
    (-1, 0)
]


function dfs!(i, j, route::Vector{Tuple{Int,Int}}, visited)
    if !visited[i, j]
        visited[i, j] = true
        global n_visited += 1

        if n_visited == N * N
            # output(route)
            visited = zeros(Bool, (N, N))
            back_home(i, j, Tuple{Int,Int}[], visited)
            # println()
        end
    end


    for (di, dj) in DIRECTIONS
        if ok(i, j, di, dj, visited)
            push!(route, (di, dj))
            dfs!(i + di, j + dj, route, visited)
            push!(route, reverse((di, dj)))
        end
    end

    return 0
end


using Printf

function shuffle!(arr)
    for i in eachindex(arr)
        j = rand(1:i)
        arr[i], arr[j] = arr[j], arr[i]
    end
end

function randdfs!(i, j, route::Vector{Tuple{Int,Int}}, visited)
    if rand() < 0.1
        shuffle!(DIRECTIONS)
    end

    if !visited[i, j]
        visited[i, j] = true
        global n_visited += 1

        if n_visited == N * N
            # output(route)
            visited = zeros(Bool, (N, N))
            back_home(i, j, Tuple{Int,Int}[], visited)
            # println()
        end
    end


    for (di, dj) in DIRECTIONS
        if ok(i, j, di, dj, visited)
            push!(route, (di, dj))
            dfs!(i + di, j + dj, route, visited)
            push!(route, reverse((di, dj)))
        end
    end

    return 0
end

function debug(current_score, new_score)
    @printf("\nベストスコアを更新: %d <- %d 改善率(%%): %f\n", new_score, current_score, (current_score - new_score) / current_score * 100)
end

function main()
    timer = Timer(600)
    route = Tuple{Int,Int}[]
    visited = zeros(Bool, (N, N))
    dfs!(1, 1, route, visited)

    best_score = score(N, d, route)
    best_route = copy(route)
    current_route = copy(route)

    while !is_timeout(timer)
        # print("-")
        route = Tuple{Int,Int}[]
        randdfs!(1, 1, route, zeros(Bool, (N, N)))
        current_route = route


        current_score = score(N, d, current_route)

        if current_score < best_score
            # debug(best_score, current_score)
            best_score = current_score
            best_route = copy(current_route)
        end
    end


    # output(best_route)
    println(score(N, d, best_route))
end


function score(N, d, route)
    score = 0
    L = length(route)
    i = 1
    j = 1
    duty_table = zeros(Int, (N, N))

    for t in 1:L
        di, dj = route[t]
        duty_table .+= d

        i += di
        j += dj
        duty_table[i, j] = 0
    end

    for t in L:2L-1
        di, dj = route[t-L+1]
        duty_table .+= d
        i += di
        j += dj
        duty_table[i, j] = 0
        score += sum(duty_table)
    end

    return Int(round(score / L))

end




main()