function naive(N, H)
    result = zeros(Int, N)
    for i in 1:N
        for j in i+1:N
            ok = true
            for k in i+1:j-1
                if H[k] > H[j]
                    ok = false
                    break
                end
            end
            if ok
                result[i] += 1
            end
        end
    end

    return result
end

function solve(N, H)
    P = zeros(Int, N)
    S = Int[]

    for j in 1:N
        while (!isempty(S)) && (H[S[end]] <= H[j])
            pop!(S)
        end
        P[j] = isempty(S) ? 0 : S[end]
        push!(S, j)
    end

    C = zeros(Int, N + 1)
    for j in 2:N
        start_i = P[j] == 0 ? 1 : P[j]
        end_i = j - 1
        if start_i <= end_i
            C[start_i] += 1
            C[end_i+1] -= 1
        end
    end

    result = zeros(Int, N)
    current = 0
    for i in 1:N
        current += C[i]
        result[i] = current
    end

    return result
end




function main()
    N = parse(Int, readline())
    H = parse.(Int, split(readline()))

    # println(join(naive(N, H), " "))

    println(join(solve(N, H), " "))
end

main()