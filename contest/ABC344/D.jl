INF = 1000000

function main()
    T = readline()
    N = parse(Int, readline())
    A = Int[]
    S = [Vector{String}() for _ in 1:N]

    for i in 1:N
        line = split(readline())
        push!(S[i], line[2:end]...)
        push!(A, parse(Int, line[1]))
    end


    dp = fill(INF, N, length(T) + 1)

    for s in S[1]
        if startswith(T, s)
            dp[1, length(s)+1] = 1
        end
    end

    for j in 0:length(T)
        _T = SubString(T, j + 1)
        for i in 1:N
            for k in i+1:N
                for s in S[k]
                    if startswith(_T, s)
                        l = length(s)
                        if j == 0
                            dp[k, j+l+1] = 1
                        else
                            dp[k, j+l+1] = min(dp[k, j+l+1], dp[i, j+1] + 1)
                        end
                    end
                end
            end
        end
    end


    ans = min(dp[:, end]...)

    if ans == INF
        println(-1)
    else
        println(ans)
    end

end

main()