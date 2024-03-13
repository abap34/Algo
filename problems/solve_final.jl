using Printf

function score(xy, x², y²)
    if x² == 0
        return 0
    end
    return y² + (xy^2 / x²) - (2xy^2 / x²)
end


function main()
    N = parse(Int, readline())
    H = parse(Int, readline())
    x = zeros(Int, N)
    y = zeros(Int, N)

    for i in 1:N
        x[i], y[i] = parse.(Int, split(readline()))
    end

    slopes = (y .- (H // 2)) .// x

    slopes_perm = sortperm(slopes, rev=true)
    x_perm = sortperm(x, rev=true)

    xy = sum(x .* y)
    x² = sum(x .* x)
    y² = sum(y .* y)

    L_best = score(xy, x², y²)
    
    for i in eachindex(x)
        upper = slopes_perm[begin:i]    
        lower = slopes_perm[i+1:end]

        upper_set = Set(upper)

        upper_x = x[upper]
        upper_y = y[upper] .- H

        upper_xy = sum(upper_x .* upper_y)
        upper_x² = sum(upper_x .* upper_x)
        upper_y² = sum(upper_y .* upper_y)
        
        lower_x = x[lower]
        lower_y = y[lower]
        
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
            _x = x[new_idx]
            _y = y[new_idx] 
            if new_idx in upper_set
                upper_xy -= _x * (_y - H)
                upper_x² -= _x^2
                upper_y² -= (_y - H)^2
                
                lower_xy += _x * _y
                lower_x² += _x^2
                lower_y² += _y^2
            else
                upper_xy += _x * (_y - H)
                upper_x² += _x^2
                upper_y² += (_y - H)^2

                lower_xy -= _x * _y
                lower_x² -= _x^2
                lower_y² -= _y^2
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