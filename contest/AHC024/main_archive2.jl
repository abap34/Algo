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
   out(map.result)
end

function out(map::Matrix)
    for i in 1:N
        for j in 1:N
            print(map[i, j])
            if j != N
                print(" ")
            end
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


# 0のところを見つけて、そのマスに対して中央から遠ざかる方向にあるマスを押し出すことで埋める
# 例: (10, 20) が空白なら、 (10, 20) から　左にあるマスを全て1マス右に動かす
function fill_to_center(map::Matrix{Int})
    for i in 2:N-1
        for j in 2:N-1
            if map[i, j] == 0
                if rand() < 0.1
                    out(map)
                end
                # 左上か右上か左下か右下かを決める
                method = "up"
                # if (i >= j) 
                #     if (N - i <= j)
                #         method = "up"
                #     else
                #         method = "right"
                #     end
                # else
                #     if (N - i <= j)
                #         method = "left"
                #     else
                #         method = "down"
                #     end
                # end
                
                # そのマスより外側にあるマスを全て1マス分中央へ
                if method == "up"
                    idxs = i:-1:N-1
                    map[idxs, j] = map[idxs .+ 1, j]
                    # map[N, j] = 0
                elseif method == "right"
                    idxs = j:N-1
                    map[i, idxs] = map[i, idxs .- 1]
                    # map[i, 1] = 0
                elseif method == "left"
                    idxs = j:-1:2
                    map[i, idxs] = map[i, idxs .+ 1]
                    # map[i, N] = 0
                elseif method == "down"
                    idxs = i:N-1
                    map[idxs, j] = map[idxs .- 1, j]
                    # map[1, j] = 0
                end
                
            end
        end
    end
    return map
end






# 四方向を全て同じ色で囲まれているマスを探しtそれを0にしたmatrixを返す
function kurinuki(map::Matrix{Int})
    for i in 2:N-1
        for j in 2:N-1
            if map[i, j] == map[i - 1, j] && map[i, j] == map[i + 1, j] && map[i, j] == map[i, j - 1] && map[i, j] == map[i, j + 1]
                map[i, j] = 0
            end
        end
    end
    return map
end


function main()
    _, _ = parse.(Int, split(readline()))
    _map = zeros(Int, (N, N))
    for i in 1:N
        _map[i, :] = parse.(Int, split(readline()))
    end

    map = Map(_map)

    res = kurinuki(map.map)


    res = fill_to_center(res)

    
    out(res)

end

main()