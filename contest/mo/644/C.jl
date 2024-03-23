using DataStructures

function main()
    N, X = parse.(Int, split(readline()))
    
    S = collect(readline())
    down_history = Stack{Char}()
    
    for s in S
        if s == 'U'
            if isempty(down_history)
                X = X ÷ 2
            else
                pop!(down_history)
            end
        elseif s == 'L'
            push!(down_history, 'L')
        elseif s == 'R'
            push!(down_history, 'R')
        end
    end

    rev_down_history = Stack{Char}()
    while !isempty(down_history)
        push!(rev_down_history, pop!(down_history))
    end
    down_history = rev_down_history

    while !isempty(down_history)
        s = pop!(down_history)
        if s == 'L'
            X = X * 2
        else
            X = X * 2 + 1
        end 
    end
    println(X)
end

main()