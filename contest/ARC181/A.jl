INF = 10^9

function isfinish(P)
    n = length(P)

    left_max = fill(-INF, n)
    right_min = fill(INF, n)

    for i in 2:n
        left_max[i] = max(left_max[i-1], P[i-1])
    end

    for i in n-1:-1:1
        right_min[i] = min(right_min[i+1], P[i+1])
    end

    for i in 1:n
        if left_max[i] < P[i] < right_min[i]
            return P[i]
        end
    end

    return -1
end


function solve_naive(N, P; k=0, seen=Set())
    if P == 1:N
        return k
    end

    answers = []

    for i in 1:N
        result = similar(P)
        if 2 <= i
            result[1:i-1] .= sort(P[1:i-1])
        end

        if i <= N - 1
            result[i+1:end] .= sort(P[i+1:end])
        end

        result[i] = P[i]

        if !(result in seen)
            push!(answers, solve_naive(N, result, k=k + 1, seen=union(seen, Set([result]))))
        end
    end

    if isempty(answers)
        return INF
    end

    return minimum(answers)
end


function solve(N, P)
    ok = true
    for i in 1:N
        if P[i] != i
            ok = false
            break
        end
    end

    (ok) && return 0

    if isfinish(P) != -1
        return 1
    end

    if (P[1] == N) && (P[N] == 1)
        return 3
    end

    return 2
end


function main()
    T = parse(Int, readline())
    for i in 1:T
        N = parse(Int, readline())
        P = parse.(Int, split(readline()))
        println(solve(N, P))
    end
end

main()