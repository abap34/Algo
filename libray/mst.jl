function kruskal(graph::Graph; by=(x -> x.weight))
    uf = UnionFind(N)

    graph = Graph(N)
    cost = 0

    sorted_edges = sort(all_edges(graph), by=by)

    for edge in sorted_edges
        if !issame!(uf, edge.from, edge.to)
            unite!(uf, edge.from, edge.to)
            add!(graph, edge)
            cost += edge.weight
            profit = max(profit, edge.profit)
        end
    end

    return graph, cost, profit
end
