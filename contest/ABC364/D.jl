using DataStructures

function main()
    N, Q = parse.(Int, split(readline()))
    A = parse.(Int, split(readline()))

    queries = Tuple{Int, Int}[]

    for _ in 1:Q
        b, k = parse.(Int, split(readline()))
        push!(queries, (b, k))
    end

    sort!(a)
    
    answers = Dict{Int, Int}()

    # b でソート
    sort!(queries, by=x->x[1])
    
    struct point
        a::Int
        moved::Bool
    end

    pq = PriorityQueue{Int, point}()

    for i in 1:N
        push!(pq, i => point(A[i], false))
    end

    before_idx = 1
    for (b, k) in queries
        # 入れたことで左に行ったやつを pq につこむ
        idx = searchsortedlast(A, b)
        
    end

end

main()