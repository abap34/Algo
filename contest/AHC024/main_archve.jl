const N = 50
const M = 100


# 隣接関係を表す行列と、各mのサイズを作成する
function info(map::Matrix{Int}) :: Tuple{Matrix{Bool}, Vector{Int}}
    adjancecy_matrix = zeros(Bool, (M, M))
    town_size = zeros(Int, M)
    for i in 1:N
        for j in 1:N
            town_size[map[i, j]] += 1
            if i == 1
                if j == 1
                    adjancecy_matrix[map[i, j], map[i, j + 1]] = true
                    adjancecy_matrix[map[i, j], map[i + 1, j]] = true
                elseif j == N
                    adjancecy_matrix[map[i, j], map[i, j - 1]] = true
                    adjancecy_matrix[map[i, j], map[i + 1, j]] = true
                else
                    adjancecy_matrix[map[i, j], map[i, j - 1]] = true
                    adjancecy_matrix[map[i, j], map[i, j + 1]] = true
                    adjancecy_matrix[map[i, j], map[i + 1, j]] = true
                end
            elseif i == N
                if j == 1
                    adjancecy_matrix[map[i, j], map[i, j + 1]] = true
                    adjancecy_matrix[map[i, j], map[i - 1, j]] = true
                elseif j == N
                    adjancecy_matrix[map[i, j], map[i, j - 1]] = true
                    adjancecy_matrix[map[i, j], map[i - 1, j]] = true
                else
                    adjancecy_matrix[map[i, j], map[i, j - 1]] = true
                    adjancecy_matrix[map[i, j], map[i, j + 1]] = true
                    adjancecy_matrix[map[i, j], map[i - 1, j]] = true
                end
            else
                if j == 1
                    adjancecy_matrix[map[i, j], map[i, j + 1]] = true
                    adjancecy_matrix[map[i, j], map[i - 1, j]] = true
                    adjancecy_matrix[map[i, j], map[i + 1, j]] = true
                elseif j == N
                    adjancecy_matrix[map[i, j], map[i, j - 1]] = true
                    adjancecy_matrix[map[i, j], map[i - 1, j]] = true
                    adjancecy_matrix[map[i, j], map[i + 1, j]] = true
                else
                    adjancecy_matrix[map[i, j], map[i, j - 1]] = true
                    adjancecy_matrix[map[i, j], map[i, j + 1]] = true
                    adjancecy_matrix[map[i, j], map[i - 1, j]] = true
                    adjancecy_matrix[map[i, j], map[i + 1, j]] = true
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
        adjancy_matrix, town_size = info(map)
        size_order = sortperm(town_size, rev=true)
        is_placed = zeros(Bool, M)
        result = zeros(Int, (N, N))
        new(map, adjancy_matrix, town_size, size_order, is_placed, result)
    end
end


function out(map::Map)
    for i in 1:N
        for j in 1:N
            print(map.result[i, j], " ")
        end
        println()
    end
end


#　マスを置く
function place!(map::Map, town_idx::Int, place_x::Int, place_y::Int)
    map.result[place_x, place_y] = town_idx
    map.is_placed[town_idx] = true
end


function place!(map::Map, town_idx::Int, place_x::UnitRange{Int}, place_y::UnitRange{Int})
    map.result[place_x, place_y] .= town_idx
    map.is_placed[town_idx] = true
end

# インデックスのリストを受け取って、それらのマスの隣接マスの候補を返す
function adjancy_cand(x_idxs::UnitRange{Int}, y_idxs::UnitRange{Int}) :: Vector{Tuple{Int, Int}}
    cand = Tuple{Int, Int}[]
    # x の左端の左一列
    for i in x_idxs[1] - 1:x_idxs[1] - 1
        for j in y_idxs
            push!(cand, (i, j))
        end
    end

    # x の右端の右一列
    for i in x_idxs[end] + 1:x_idxs[end] + 1
        for j in y_idxs
            push!(cand, (i, j))
        end
    end

    # y の上端の上一列
    for i in x_idxs
        for j in y_idxs[1] - 1:y_idxs[1] - 1
            push!(cand, (i, j))
        end
    end

    # y の下端の下一列
    for i in x_idxs
        for j in y_idxs[end] + 1:y_idxs[end] + 1
            push!(cand, (i, j))
        end
    end

    return cand
end



function main()
    _, _ = parse.(Int, split(readline()))
    _map = zeros(Int, (N, N))
    for i in 1:N
        _map[i, :] = parse.(Int, split(readline()))
    end

    map = Map(_map)

    
    
    # 一番真ん中に一番大きいマスを置く 

    # 一番大きいマスに隣接しているマスを列挙
    max_town_idx = argmax(map.town_size)
    adjancecy_town = findall(map.adjancy_matrix[max_town_idx, :])

    # 4 + 2n >= length(adjancecy_town) を満たす最小のnを求める
    # この n のぶんだけ上下に伸ばせば良い
    n = cld(length(adjancecy_town) - 4, 2)

    # n ÷ 2 個分、中央から上下に伸ばせば良い
    place_idxs = (N ÷ 2) - (n ÷ 2) : (N ÷ 2) + (n ÷ 2)


    # 置く
    place!(map, max_town_idx, place_idxs, N ÷ 2:N ÷ 2)

    # 置いたやつの周りに、一番大きいマスに隣接しているマスを置く
    cand = adjancy_cand(place_idxs, N ÷ 2:N ÷ 2)


    for i in eachindex(adjancecy_town)
        place!(map, adjancecy_town[i], cand[i][1], cand[i][2])
    end

    for i in eachindex(adjancecy_town)
        # そのマスに隣接しているマスを列挙
        adjancecy_town = findall(map.adjancy_matrix[adjancecy_town[i], :])
        # そのマスに隣接しているマスのうち、まだ置かれていないマスを列挙
        




    
    

    out(map)

end

main()