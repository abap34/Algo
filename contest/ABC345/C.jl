function swap(S, i, j)
    result = copy(S)
    result[i], result[j] = result[j], result[i]
    return result
end

function naive(S)
    N = length(S)
    results = Set{Vector{Char}}()

    for i in 1:N
        for j in i+1:N
            push!(results, swap(S, i, j))
        end
    end

    return length(results)
end

function main()
    S = collect(readline())
    N = length(S)

    C = Dict{Char, Int}()

    for i in 1:N
        if haskey(C, S[i])
            C[S[i]] += 1
        else
            C[S[i]] = 1
        end
    end

    ans = (N - 1) * N ÷ 2 + 1

    for v in values(C)
        ans -= (v - 1) * v ÷ 2
    end

    if ans == (N - 1) * N ÷ 2 + 1
        println(ans - 1)
    else
        println(ans)
    end
end

main()