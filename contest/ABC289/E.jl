function main()
    N = parse(Int, readline())
    solve()

end

function dfs(graph, i, d, t_d)
    if i == 1
        push!(t_d, d + 1)
    else
        for j in 1:N
            if graph[i, j]
                dfs(graph, j, d + 1, t_d)
            end
        end
    end
end

function solve_change(N, M, C)
    t_graph = zeros(Bool, N, N)
    a_graph = zeros(Bool, N, N)
    t_color = C[1]
    a_color = C[N]
    graph = zeros(Bool, N, N)
    for _ in 1:M
        u, v = parse.(Int, split(readline()))
        if C[u] != C[v]
            graph[u, v] = true
        end
    end
    # 1を含む閉路の長さを全部調べる
    t_d = []
    dfs(graph, 1, 0, t_d)
    # N -> 1の距離を全部調べる

end


function solve()
    N, M = parse.(Int, split(readline()))
    C = parse.(Int, split(readline()))

    # check same color when t = 0 
    if C[1] == C[N]
        println(-1)
    else
        solve_change(N, M, C)
    end
end

main()