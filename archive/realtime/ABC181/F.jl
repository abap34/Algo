base_ans = sum(A)
    s_H = H[1]
    h_H = H[N]
    min_value = 10000000000
    for w in W
        if (w < s_H) && (s_H - w < min_value)
            min_value = s_H - w
        end

        if (w > h_H) && (w - h_H < min_value)
            min_value = w - h_H 
        end
    end

    return base_ans + min_value