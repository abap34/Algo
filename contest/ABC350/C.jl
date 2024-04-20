function solve(N, A)
    # number -> index
    idx = Dict{Int, Int}()

    for i in 1:N
        idx[A[i]] = i
    end

    history = Tuple{Int, Int}[]

    for i in 1:N
        swap_idx = idx[i]
        push!(history, (i, swap_idx))
        
        idx[i] = i
        
        idx[A[i]] = swap_idx


        A[i], A[swap_idx] = A[swap_idx], A[i]
    end

    for (v, i) in idx
        @assert v == i
    end


    return history

end


function main()
    N = parse(Int, readline())
    A = parse.(Int, split(readline()))

    history = solve(N, A)

    c = 0

    for h in history[1:end-1]
        left, right = h

        if left == right
            continue
        end

        c += 1
    end

    @assert c <= N - 1
    @assert sort(A) == collect(1:N)

    println(c)

    for h in history[1:end-1]
        left, right = h

        if left == right
            continue
        end

        @assert left < right

        println(left, " ", right)
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    main()
end