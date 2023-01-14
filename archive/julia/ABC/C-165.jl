parseInt(x) = parse(Int, x)
parseMap(x::Array{SubString{String},1}) = map(parseInt, x)

N, M, Q = parseMap(split(readline()))

A = zeros(Int, Q)
B = zeros(Int, Q)
C = zeros(Int, Q)
D = zeros(Int, Q)

for i in 1:Q
    A[i], B[i], C[i], D[i] = parseMap(split(readline()))
end




function dfs(v, result)
    if length(result) == N
        score = 0
        for i in 1:Q
            a, b, c, d = A[i], B[i], C[i], D[i]
            if result[b] - result[a] == c
                score += d
            end
        end
        return score
    end         

    ans = -1
    for next_v in v:M
        push!(result, v) 
        ans = max(dfs(next_v, result), ans)
        pop!(result)
    end
    return ans
end

function main()
    max_score = -1
    for i in 1:M
        score = dfs(i, [])
        if score > max_score
            max_score = score
        end
    end

    println(max_score)
end

main()  