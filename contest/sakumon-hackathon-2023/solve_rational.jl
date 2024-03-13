using ProgressBars
using Printf

function score(xy, x², y²)
    if x² == 0
        return 0
    end
    coef = xy // x²
    return y² + (coef^2 * x²) - (2coef * xy)
end


function main()
    N = parse(BigInt, readline())
    H = parse(BigInt, readline())
    x = zeros(BigInt, N)
    y = zeros(BigInt, N)

    for i in 1:N
        x[i], y[i] = parse.(BigInt, split(readline()))
    end

    slopes = (y .- (H // 2)) .// x

    slopes_perm = sortperm(slopes, rev=true)
    x_perm = sortperm(x, rev=true)

    xy = sum(x .* y)
    x² = sum(x .* x)
    y² = sum(y .* y)

    L_best = score(xy, x², y²)
    
    for i in ProgressBar(eachindex(x))
        upper = slopes_perm[begin:i]    
        lower = slopes_perm[i+1:end]

        upper_set = Set(upper)

        upper_x = getindex.(Ref(x), upper)
        upper_y = getindex.(Ref(y .- H), upper)
        
        upper_xy = sum(upper_x .* upper_y)
        upper_x² = sum(upper_x .* upper_x)
        upper_y² = sum(upper_y .* upper_y)
        
        lower_x = getindex.(Ref(x), lower)
        lower_y = getindex.(Ref(y), lower)
        
        lower_xy = sum(lower_x .* lower_y)
        lower_x² = sum(lower_x .* lower_x)
        lower_y² = sum(lower_y .* lower_y)

        L_u = score(upper_xy, upper_x², upper_y²)
        L_b = score(lower_xy, lower_x², lower_y²)

        L = L_u + L_b
        if L < L_best
            L_best = L
        end
        
        for j in eachindex(x)
            new_idx = x_perm[j]     
            if new_idx in upper_set
                upper_xy -= x[new_idx] * (y[new_idx] - H)
                upper_x² -= x[new_idx]^2
                upper_y² -= (y[new_idx] - H)^2
                
                lower_xy += x[new_idx] * y[new_idx]
                lower_x² += x[new_idx]^2
                lower_y² += y[new_idx]^2
            else
                upper_xy += x[new_idx] * (y[new_idx] - H)
                upper_x² += x[new_idx]^2
                upper_y² += (y[new_idx] - H)^2

                lower_xy -= x[new_idx] * y[new_idx]
                lower_x² -= x[new_idx]^2
                lower_y² -= y[new_idx]^2
            end

            L_u = score(upper_xy, upper_x², upper_y²)
            L_b = score(lower_xy, lower_x², lower_y²)
    
            L = L_u + L_b
            if L < L_best
                L_best = L
            end
            
        end        
    end 
    @printf "%0.20f\n" L_best
end

main()