function penalty(c, d, last_days)
    s = 0
    for i in 1:26
        s += c[i] * (d - last_days[i])
    end
    return s
end

function score(history, c, S)
    score = 0
    all_penalty = 0

    last_days = zeros(Int, 26)
    
    for (_d, h) in enumerate(history) 
        last_days[h] = _d
        score += S[_d, h]
        all_penalty += penalty(c, _d, last_days)
    end 

    return score - all_penalty
end



function main()
    D = parse(Int, readline())
    c = parse.(Int, split(readline()))
    S = zeros(Int, D, 26)
    t = zeros(Int, D)

    for i in 1:D
        s = parse.(Int, split(readline()))
        S[i, :] = s
    end
    
    
    for i in 1:D
        t[i] = parse(Int, readline())
    end


    for i in 1:D
        println(score(t[1:i], c, S))
    end

        
end




main()