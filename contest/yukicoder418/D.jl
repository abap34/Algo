using DataStructures

function main()
    N, A = parse.(Int, split(readline()))
    X = parse.(Int, split(readline()))

    T = parse(Int, readline())

    pusht = [Int[] for _ in 1:N + 1]
    popt = [Int[] for _ in 1:N + 1]

    L = Int[]
    R = Int[]
    for _ in 1:T
        l, r = parse.(Int, split(readline()))
        push!(L, l)
        push!(R, r)
    end

    for (t, (l, r)) in enumerate(zip(L, R))
        l = searchsortedfirst(X, l)
        r = searchsortedlast(X, r) 
        push!(pusht[l], t)
        push!(popt[r], t)
    end

    current = PriorityQueue{Int, Int}(Base.Order.Reverse)

    @show pusht
    @show popt

    enqueue!(current, -1 => -1)
    
    for i in 1:N
        if !isempty(pusht[i])
            for t in pusht[i]
                enqueue!(current, t => t)
            end
        end

        println(first(peek(current)))

        if !isempty(popt[i])
            for t in popt[i]
                delete!(current, t)
            end
        end
    end


end

main()
