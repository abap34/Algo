using Printf

function solve(x::AbstractArray{Int}, y::AbstractArray{Int})
    if isempty(x)
        return 0
    end
    coef = sum(x .* y) / sum(x -> x^2, x)
    l = sum(x -> x^2, (y .- x .* coef))
    return l
end


function main()
    N = parse(Int, readline())
    H = parse(Int, readline())
    x = zeros(Int, N)
    y = zeros(Int, N)
    for i in 1:N
        x[i], y[i] = parse.(Int, split(readline()))
    end



    INF = 10^16
    slopes = zeros(Rational{Int}, N)
    for i in eachindex(x)
        if x[i] == 0
            slopes[i] = INF 
        else
            slopes[i] = (y[i] - (H // 2)) // x[i]
        end
    end


    slopes_perm = sortperm(slopes, rev=true)
    x_perm = sortperm(x)

    L_best = Inf    

    for i in eachindex(x)
        upper = slopes_perm[begin:i]
        lower = slopes_perm[i+1:end]
        for j in eachindex(x)
            left = Set(x_perm[begin:j])
            right = Set(x_perm[j+1:end])
            
            target_hu = (left ∩ upper) ∪ (right ∩ lower)
            target_hd = (left ∩ lower) ∪ (right ∩ upper)
            
            x_hu = getindex.(Ref(x), target_hu)
            y_hu = getindex.(Ref(y .- H), target_hu)

            l_hu = solve(x_hu, y_hu)

            x_hd = getindex.(Ref(x), target_hd)
            y_hd = getindex.(Ref(y), target_hd)

            l_hd = solve(x_hd, y_hd)
            
            L = l_hu + l_hd

            if L < L_best
                L_best = L
            end
        end
    end 


    @printf "%0.20f\n" L_best
end

main()