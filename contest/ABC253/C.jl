using DataStructures

Q = parse(Int, readline())

function main(Q)  
    D = Dict{Int, Int}()
    min_que = PriorityQueue{Int, Int}()
    max_que = PriorityQueue{Int, Int}()
    for i in 1:Q
        q = parse.(Int, split(readline()))
        if q[1] == 1
            if haskey(D, q[2])
                D[q[2]] += 1
            else
                D[q[2]] = 1
                enqueue!(min_que, q[2] => q[2])
                enqueue!(max_que, q[2] => -q[2])
            end
        elseif q[1] == 2
            if !(haskey(D, q[2]))
                continue
            elseif D[q[2]] > q[3]
                D[q[2]] = D[q[2]] - q[3]
            else
                delete!(D, q[2])
                delete!(min_que, q[2])
                delete!(max_que, q[2])
            end
        else
            println(-(peek(max_que)[2] + peek(min_que)[2]))
        end
    end
end



main(Q)