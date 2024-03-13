Graph = Vector{Vector{Int}}


struct LCA
    parent::Vector{Vector{Int}}  # parent[k][u] := u の 2^(k-1) 先の親
    # dist::Vector{Vector{Int}}  # dist[k][u] := 頂点 u から 2^(k-1) 個先の親ノードまでの辺のうちコストが最大のもののコスト
    depth::Vector{Int}
    function LCA(graph::Graph, root::Int)
        V = length(graph)
        K = ceil(Int, log2(V))
        parent = [fill(-1, V) for _ in 1:K]
        depth = fill(-1, V)
        # dist = fill(fill(-1, V), K)



        # dfs して depth を埋める
        function dfs(v, p, d)
            depth[v] = d
            # 2^(1-1) = 1個先の親はここで埋めれる
            parent[1][v] = p
            for u in graph[v]
                if u != p
                    dfs(u, v, d + 1)
                end
            end
        end

        dfs(root, -1, 0)

        # @show parent


        # parent を埋める
        # parent[k+1][u] = parent[k][parent[k][u]] で埋める. k = 1　は埋まってるのでそっからもらう
        # dist[k+1][u] = max(dist[k][u], dist[k][parent[k][u]]) で埋める
        # 最大値更新しない or 飛んでくる前のやつで更新        <- 一旦後で

        for k in 1:K-1
            for v in 1:V
                if parent[k][v] == -1
                    parent[k+1][v] = -1
                    # dist[k+1][v] = dist[k][v]
                else
                    parent[k+1][v] = parent[k][parent[k][v]]
                    # dist[k+1][v] = max(dist[k][v], dist[k][parent[k][v]])
                end
            end
        end



        # @show parent

        return new(parent, depth)
    end
end


function query(lca::LCA, u::Int, v::Int)
    # println("u: ", u, " v: ", v)
    K = length(lca.parent)

    # @show lca.depth[u], lca.depth[v]
    # depth(u) > depth(v) になるようにする
    if lca.depth[u] < lca.depth[v]
        # println("一つ目の方が深くなるように swap")
        u, v = v, u
    end


    diff = lca.depth[u] - lca.depth[v]

    # u を上に持ってきて深さ揃える

    # @show bitstring(diff)

    for k in 0:K-1
        # ビットが立ってるなら進める
        # println("$k ビット目: ", (diff >> k) & 1 == 1)
        if (diff >> k) & 1 == 1
            u = lca.parent[k+1][u]
        end
    end



    # 揃えて一致してるなら LCA
    if u == v
        return u
    end

    for k in K:-1:1
        # 進めた先が一致(共通祖先に到達しない)なら進める
        # 一致するなら終わり
        if lca.parent[k][u] != lca.parent[k][v]
            u = lca.parent[k][u]
            v = lca.parent[k][v]
        end
    end

    # 次で一致するので一個進めたやつが共通祖先

    return lca.parent[1][u]


end


function main()
    N = 7
    graph = [
        Int64[2, 1,],
        Int64[3, 2, 5, 2,],
        Int64[],
        Int64[5, 4,],
        Int64[],
    ]
    
    # lca = LCA(graph, 1)
    # @show query(lca, 2, 3)
    # @show query(lca, 4, 5)
    # @show query(lca, 3, 4)
    # @show query(lca, 1, 5)
end

main()