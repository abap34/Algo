function count(arr)::Dict
    d = Dict()
    for a in arr
        if haskey(d, a)
            d[a] += 1
        else
            d[a] = 1
        end
    end
    return d
end

struct State
    state::Vector{Char}
    brank_idx::Int
end

function main()
    N = parse(Int, readline())
    S = collect(readline())
    T = collect(readline())

    if count(S) != count(T)
        println(-1)
        return
    end

    function isfinish(state)
        return state.state[1:end-2] == T
    end

    init_state = State([S..., '.', '.'], N+1)
    seen = Set{Vector{Char}}()
    push!(seen, init_state.state)

    function move(state::State, i)
        new_state = copy(state.state)

        new_state[state.brank_idx] = new_state[i]
        new_state[state.brank_idx+1] = new_state[i+1]
        new_state[i] = '.'
        new_state[i+1] = '.'


        return State(new_state, i)
    end

    function allowed(state::State, i)
        return state.state[i] != '.' && state.state[i+1] != '.'
    end


    queue = [(init_state, 0)]

    function out(state)
        println(join(state.state))
    end


    while length(queue) > 0
        state, count = popfirst!(queue)

        if isfinish(state)
            println(count)
            return
        end

        for i in 1:N+1
            if allowed(state, i)
                new_state = move(state, i)
                if !(new_state.state in seen)
                    push!(seen, new_state.state)
                    push!(queue, (new_state, count+1))
                end
            end
        end
    end


    println(-1)
    
end

main()