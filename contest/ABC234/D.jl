using DataStructures
N, K = parse.(Int, split(readline()))
P = parse.(Int, split(readline()))


function main(N, K, P)
    q = PriorityQueue{Int, Int}()
    for p in P[1:K]
        enqueue!(q, p=>p)
    end
    ans = dequeue!(q)
    println(ans)
    for p in P[K+1:N]
        if p > ans
            enqueue!(q, p=>p)
            ans = dequeue!(q)
        end
        println(ans)
    end
end


main(N, K, P)