using Dates
using Random

Random.seed!(34)

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


function rate(x::Timer)
    now_time = Dates.now()
    elapsed_time = now_time - x.created
    return x.timeout / elapsed_time
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
    change_idx1 = rand(1:DAY)
    change_idx2 = rand(1:DAY)
    change_contest1 = rand(1:CONTEST_TYPE)
    change_contest2 = rand(1:CONTEST_TYPE)    
    prev1 = choices[change_idx1]
    prev2 = choices[change_idx2]
    choices[change_idx1] = change_contest1
    choices[change_idx2] = change_contest2
    return change_idx1, change_idx2, prev1, prev2
end

function hill_clim!(choices, c, S, timer; start_tmp=2000, end_tmp=600)
    current_score = score(choices, c, S)
    while !(is_timeout(timer))
        change_idx1, change_idx2, prev1, prev2 = randomnext!(choices)
        new_score = score(choices, c, S)
        diff = current_score - new_score
        now_tmp = start_tmp + (start_tmp - end_tmp) * rate(timer)
        prob = exp(diff / now_tmp)
        if prob < rand()
            current_score = new_score
        else
            choices[change_idx1] = prev1
            choices[change_idx2] = prev2
        end
    end
end



function main()
    timer = Timer(1300)
    
    D = parse(Int, readline())
    c = parse.(Int, split(readline()))
    S = zeros(Int, D, CONTEST_TYPE)

    for i in 1:D
        s = parse.(Int, split(readline()))
        S[i, :] = s
    end
    

    init = greedy(D, c, S)
    
    hill_clim!(init, c, S, timer)

    # output(init)

    println("score:", score(init, c, S))
    # @show n_update
end




main()