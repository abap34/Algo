
using Random
using Dates


const N = 50
const M = 101
const EMPTY = 1
const DUMMY = -100

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
    if elapsed_time >= x.timeout
        return true
    end
    return false
end

function reset!(x::Timer)
    x.created = Dates.now()
end

function rate(x::Timer)
    now_time = Dates.now()
    elapsed_time = now_time - x.created
    return x.timeout / elapsed_time
end



function info(map::Matrix{Int})::Tuple{Matrix{Bool},Vector{Int}}
    adjancecy_matrix = zeros(Bool, (M, M))
    town_size = zeros(Int, M)
    for i in 1:N
        for j in 1:N
            town_size[map[i, j]] += 1
            if (i == 1) || (j == 1) || (i == N) || (j == N)
                adjancecy_matrix[EMPTY, map[i, j]] = true
            end

            if i == 1
                if j == 1
                    adjancecy_matrix[map[i, j], map[i, j+1]] = true
                    adjancecy_matrix[map[i, j], map[i+1, j]] = true
                elseif j == N
                    adjancecy_matrix[map[i, j], map[i, j-1]] = true
                    adjancecy_matrix[map[i, j], map[i+1, j]] = true
                else
                    adjancecy_matrix[map[i, j], map[i, j-1]] = true
                    adjancecy_matrix[map[i, j], map[i, j+1]] = true
                    adjancecy_matrix[map[i, j], map[i+1, j]] = true
                end
            elseif i == N
                if j == 1
                    adjancecy_matrix[map[i, j], map[i, j+1]] = true
                    adjancecy_matrix[map[i, j], map[i-1, j]] = true
                elseif j == N
                    adjancecy_matrix[map[i, j], map[i, j-1]] = true
                    adjancecy_matrix[map[i, j], map[i-1, j]] = true
                else
                    adjancecy_matrix[map[i, j], map[i, j-1]] = true
                    adjancecy_matrix[map[i, j], map[i, j+1]] = true
                    adjancecy_matrix[map[i, j], map[i-1, j]] = true
                end
            else
                if j == 1
                    adjancecy_matrix[map[i, j], map[i, j+1]] = true
                    adjancecy_matrix[map[i, j], map[i-1, j]] = true
                    adjancecy_matrix[map[i, j], map[i+1, j]] = true
                elseif j == N
                    adjancecy_matrix[map[i, j], map[i, j-1]] = true
                    adjancecy_matrix[map[i, j], map[i-1, j]] = true
                    adjancecy_matrix[map[i, j], map[i+1, j]] = true
                else
                    adjancecy_matrix[map[i, j], map[i, j-1]] = true
                    adjancecy_matrix[map[i, j], map[i, j+1]] = true
                    adjancecy_matrix[map[i, j], map[i-1, j]] = true
                    adjancecy_matrix[map[i, j], map[i+1, j]] = true
                end
            end
        end
    end
    for i in 1:M
        adjancecy_matrix[i, i] = false
    end

    for i in 1:M
        for j in 1:M
            if adjancecy_matrix[i, j]
                adjancecy_matrix[j, i] = true
            end
        end
    end

    return adjancecy_matrix, town_size
end



function out(map::Matrix)
    for i in 1:N
        for j in 1:N
            print(map[i, j] - 1)
            if j != N
                print(" ")
            end
        end
        println()
    end
end


function check_connect(map, x, y)::Bool
    if ((x == 1) && (y == 1) || (y == 1) && (x == N) || (x == N) && (y == N) || (y == N) && (x == 1))
        return true
    end
    c = map[x, y]
    return check_it(c, map, x, y)
end


function check_it(c, map, x, y)
    m = map[max(1, x - 1):min(N, x + 1), max(1, y - 1):min(N, y + 1)]

    _n, _m = size(m)

    if (x != 1) && (x != N) && (y != 1) && (y != N)
        m[2, 2] = DUMMY
    else
        if x == 1
            m[1, 2] = DUMMY
        elseif x == N
            m[2, 2] = DUMMY
        elseif y == 1
            m[2, 1] = DUMMY
        elseif y == N
            m[2, 2] = DUMMY
        end
    end

    _n, _m = size(m)

    for i in 1:_n
        for j in 1:_m
            if m[i, j] == c
                ok = false
                for d in [(-1, 0), (1, 0), (0, -1), (0, 1)]
                    _x, _y = i + d[1], j + d[2]
                    if (_x < 1) || (_x > _n) || (_y < 1) || (_y > _m)
                        continue
                    end
                    if m[i+d[1], j+d[2]] == c
                        ok = true
                    end
                end
                if !ok
                    return false
                end
            end
        end
    end

    is_c = (m .== c)

    done_bfs = false
    visited = zeros(Bool, (_n, _m))
    for i in 1:_n
        for j in 1:_m
            if !(done_bfs) && is_c[i, j]
                done_bfs = true
                stack = [(i, j)]
                while !isempty(stack)
                    _i, _j = pop!(stack)
                    if visited[_i, _j]
                        continue
                    end
                    visited[_i, _j] = true
                    if _i != 1
                        if is_c[_i-1, _j]
                            push!(stack, (_i - 1, _j))
                        end
                    end
                    if _i != _n
                        if is_c[_i+1, _j]
                            push!(stack, (_i + 1, _j))
                        end
                    end
                    if _j != 1
                        if is_c[_i, _j-1]
                            push!(stack, (_i, _j - 1))
                        end
                    end
                    if _j != _m
                        if is_c[_i, _j+1]
                            push!(stack, (_i, _j + 1))
                        end
                    end
                end
            else
                if is_c[i, j] && !visited[i, j]
                    return false
                end
            end
        end

    end
    return true
end


function valid_place!(t, map, adj, x, y)
    ok = check_connect(map, x, y)
    if !ok
        return
    end
    if !((x == 1) || (y == 1) || (x == N) || (y == N))
        ok = false
        for d in [(-1, 0), (1, 0), (0, -1), (0, 1)]
            _x, _y = x + d[1], y + d[2]
            if (_x < 1) || (_x > N) || (_y < 1) || (_y > N)
                continue
            end
            if map[_x, _y] == EMPTY
                ok = true
                break
            end
        end
    end

    if !ok
        return
    end

    prev = map[x, y]
    map[x, y] = t
    _adj, _ = info(map)
    if adj == _adj
        return
    else
        map[x, y] = prev
    end
end


function solve!(map, timer)
    adjancy_matrix, _ = info(map)

    while !is_timeout(timer)
        for k in 0:N-1
            start_idx = k + 1
            end_idx = N - k

            for j in start_idx:end_idx
                valid_place!(EMPTY, map, adjancy_matrix, start_idx, j)
                valid_place!(EMPTY, map, adjancy_matrix, end_idx, j)
                valid_place!(EMPTY, map, adjancy_matrix, j, start_idx)
                valid_place!(EMPTY, map, adjancy_matrix, j, end_idx)
            end

            if is_timeout(timer)
                return map
            end
        end

        for k in 2:N-1
            start_idx = k + 1
            end_idx = N - k

            for j in start_idx:end_idx
    
                valid_place!(EMPTY, map, adjancy_matrix, start_idx, j)
                valid_place!(EMPTY, map, adjancy_matrix, end_idx, j)
                valid_place!(EMPTY, map, adjancy_matrix, j, start_idx)
                valid_place!(EMPTY, map, adjancy_matrix, j, end_idx)
            end

            if is_timeout(timer)
                return map
            end

            
            end

            if is_timeout(timer)
                return map
            end
        end

        
        # out(map)
    end

    return map
end


function main()
    timer = Timer(1000)

    _, _ = parse.(Int, split(readline()))
    map = zeros(Int, (N, N))

    for i in 1:N
        map[i, :] = parse.(Int, split(readline()))
    end

    map .+= 1

    solve!(map, timer)

    out(map)

end

main()