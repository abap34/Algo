function main()
    N, T = parse.(Int, split(readline()))
    points = zeros(Int, N)
    points_dict = Dict{Int,Int}()
    points_dict[0] = N
    unique_count = 1

    for _ in 1:T
        a, b = parse.(Int, split(readline()))
        
        new_points = points[a] + b
        c = points_dict[points[a]]
        points_dict[points[a]] = points_dict[points[a]] - 1

        if c > 1
            # 複数個 -> ある
            if haskey(points_dict, new_points) && points_dict[new_points] > 0
                points_dict[new_points] = points_dict[new_points] + 1
            # 複数個 ->　ない
            else
                points_dict[new_points] = 1
                unique_count += 1
            end
        else
            # ラスト -> ある
            if haskey(points_dict, new_points) && points_dict[new_points] > 0
                points_dict[new_points] = points_dict[new_points] + 1
                unique_count -= 1
            # ラスト -> ない
            else
                points_dict[new_points] = 1
            end
        end


        points[a] = new_points

        println(unique_count)
        
        # println(points_dict)
        # println(points)
        # println("============")
    end
end

main()