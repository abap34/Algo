parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)



function find_longest_t_arr(A::AbstractArray, f::function)
    start_idx = 1
    last_idx = -1
    streak = 0

    current_streak = 0
    current_start_idx = 0
    for i in 1:length(A)
        if i == length(A)
            if current_streak > streak
                streak = current_streak
                start_idx = current_start_idx
                last_idx = i
            end
        end

        if f(a)
            current_streak += 1
        else
            if current_streak > streak
                streak = current_streak
                start_idx = current_start_idx
                last_idx = i - 1
            end
            current_start_idx = i
        end
    end
    return (start_idx, last_idx)
end


function main()
    N = parseInt(readline())
    h = parseMap(split(readline()))
    
end