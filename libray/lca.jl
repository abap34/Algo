struct LCA
    parent::Vector{Vector{Int}}
    dist::Vector{Vector{Int}}
    depth::Vector{Int}
    K::Int
    V::Int
    function LCA(graph::Graph; root=1)
        V = length(graph.edges)
        K = ceil(Int, log2(V))

        tree = as_rooted_tree(graph, root)

        parent = [fill(-1, V) for _ in 1:K]
        dist = [fill(-1, V) for _ in 1:K]
        depth = fill(-1, V)

        stack = [(root, -1, 0)]

        while !isempty(stack)
            v, p, d = pop!(stack)
            depth[v] = d
            parent[1][v] = p
            for u in tree.edges[v]
                if u.to != p
                    dist[1][u.to] = u.weight
                    push!(stack, (u.to, v, d + 1))
                end
            end
        end


        for k in 1:K-1
            for v in 1:V
                if parent[k][v] == -1
                    continue
                else
                    parent[k+1][v] = parent[k][parent[k][v]]
                    dist[k+1][v] = max(dist[k][v], dist[k][parent[k][v]])
                end
            end
        end

        return new(parent, dist, depth, K, V)
    end
end
