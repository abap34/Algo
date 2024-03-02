using Dates
using Random

const DAY = 365
const CONTEST_TYPE = 26

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


function penalty(c, d, last_days)
    s = 0
    for i in 1:CONTEST_TYPE
        s += c[i] * (d - last_days[i])
    end
    return s
end

function score(history, c, S)
    score = 0
    all_penalty = 0

    last_days = zeros(Int, CONTEST_TYPE)
    
    for (_d, h) in enumerate(history) 
        last_days[h] = _d
        score += S[_d, h]
        all_penalty += penalty(c, _d, last_days)
    end 

    return score - all_penalty
end


function output(choice)
    for c in choice
        println(c)
    end
end


function greedy(D, c, S)
    history = Int[]
    for _ in 1:D
        res = Int[]
        for j in 1:CONTEST_TYPE
            push!(history, j)
            push!(res, score(history, c, S))
            pop!(history)
        end
        choice = argmax(res)
        push!(history, choice)
    end
    return history
end


function randomnext!(choices)
    change_idx = rand(1:DAY)
    change_contest = rand(1:CONTEST_TYPE)    
    prev = choices[change_idx]
    choices[change_idx] = change_contest
    return change_idx, prev
end


function hill_clim!(choices, c, S, timer)
    # n_update = 0
    current_score = score(choices, c, S)
    while !(is_timeout(timer))
        # n_update += 1
        change_idx, prev = randomnext!(choices)
        new_score = score(choices, c, S)
        if new_score > current_score
            current_score = new_score
        else
            choices[change_idx] = prev
        end
    end
    # return n_update
end



function main()
    D = parse(Int, readline())
    c = parse.(Int, split(readline()))
    S = zeros(Int, D, CONTEST_TYPE)

    for i in 1:D
        s = parse.(Int, split(readline()))
        S[i, :] = s
    end
    
    timer = Timer(1900)

    init = greedy(D, c, S)

    # n_update = hill_clim!(init, c, S, timer)
    hill_clim!(init, c, S, timer)


    output(init)

end




main()