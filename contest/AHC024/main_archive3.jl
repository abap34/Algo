using Random
using Dates


const N = 50
const M = 101
const EMPTY = 1

Random.seed!(34)


mutable struct Timer
    timeout::Millisecond
    created::DateTime
end

function Timer(timeout_ms::Int) 
    return Timer(Millisecond(timeout_ms), Dates.now())
end

Base.Bool(x::Timer) = is_timeout(x)

function is_timeout(x::Timer)
    now_time = Dates.now()
    elapsed_time = now_time - x.created
    if elapsed_time >= x.timeout
        return true
    end
    return false
end


function rate(x::Timer)
    now_time = Dates.now()
    elapsed_time = now_time - x.created
    return x.timeout / elapsed_time
end



# 隣接関係を表す行列と、各mのサイズを作成する
function info(map::Matrix{Int})::Tuple{Matrix{Bool},Vector{Int}}
    adjancecy_matrix = zeros(Bool, (M, M))
    town_size = zeros(Int, M)
    for i in 1:N
        for j in 1:N
            town_size[map[i, j]] += 1
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
    # 隣接の対角成分はfalseにする
    for i in 1:M
        adjancecy_matrix[i, i] = false
    end
    return adjancecy_matrix, town_size
end

struct Map
    map::Matrix{Int}
    adjancy_matrix::Matrix{Bool}
    town_size::Vector{Int}
    size_order::Vector{Int}
    is_placed::Vector{Bool}
    result::Matrix{Int}
    function Map(map::Matrix{Int})
        map .+= 1
        adjancy_matrix, town_size = info(map)
        size_order = sortperm(town_size, rev=true)
        is_placed = zeros(Bool, M)
        result = zeros(Int, (N, N))
        new(map, adjancy_matrix, town_size, size_order, is_placed, result)
    end
end


function out(map::Map)
    out(map.result)
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


# i, j ますから上下左右にまとめて動かす
function fill_to_center(map::Matrix{Int}, method::String, i::Int, j::Int)
    new_map = copy(map)
    if method == "up"
        idxs = i:-1:N-1
        new_map[idxs, j] = map[idxs.+ 1, j]
        new_map[N, j] = EMPTY
    elseif method == "right"
        idxs = j:N-1
        new_map[i, idxs] = map[i, idxs.-1]
        new_map[i, 1] = EMPTY
    elseif method == "left"
        idxs = j:-1:2
        new_map[i, idxs] = map[i, idxs.+1]
        new_map[i, N] = EMPTY
    elseif method == "down"
        idxs = i:N-1
        new_map[idxs, j] = map[idxs.-1, j]
        new_map[1, j] = EMPTY
    end
    return new_map
end


# function move(map::Matrix{Int}, method::String, i::Int, j::Int)
#     new_map = copy(map)
#     if method == "up"
#         new_map[i - 1, :] = map[i, :]
#         new_map[N, :] .= EMPTY
#     elseif method == "right"
#         new_map[:, j + 1] = map[:, j]
#         new_map[:, 1] .= EMPTY
#     elseif method == "left"
#         new_map[:, j - 1] = map[:, j]
#         new_map[:, N] .= EMPTY
#     elseif method == "down"
#         new_map[i + 1, :] = map[i, :]
#         new_map[1, :] .= EMPTY
#     end
#     return new_map
# end

# function move(map::Matrix{Int}, method::String, i::Int, j::Int)
#     new_map = copy(map)
#     if method == "up"
#         new_map[i - 1, j] = map[i, j]
#         new_map[N, j] = EMPTY
#     elseif method == "right"
#         new_map[i, j + 1] = map[i, j]
#         new_map[i, 1] = EMPTY
#     elseif method == "left"
#         new_map[i, j - 1] = map[i, j]
#         new_map[i, N] = EMPTY
#     elseif method == "down"
#         new_map[i + 1, j] = map[i, j]
#         new_map[1, j] = EMPTY
#     end
#     return new_map
# end

# やきなます
function annealing(map::Map, timer::Timer)
    current_map = copy(map.map)
    for i in 1:25
        # 外から i　番目の外周のインデックスを列挙
        idxs = Int[]
        for j in 1:N
            push!(idxs, (i, j))
            push!(idxs, (N - i + 1, j))
            push!(idxs, (j, i))
            push!(idxs, (j, N - i + 1))
        end

        # 一個ランダムに取り出す
        idx = rand(idxs)
        # 真ん中に向けてランダムに動かす
        method = rand(["up", "right", "left", "down"])
        new_map = fill_to_center(current_map, method, idx[1], idx[2])

        


    return current_map
end


function main()
    timer = Timer(200)

    _, _ = parse.(Int, split(readline()))
    _map = zeros(Int, (N, N))
    for i in 1:N
        _map[i, :] = parse.(Int, split(readline()))
    end

    map = Map(_map)

    result = annealing(map, timer)


    out(result)
    
end

main()