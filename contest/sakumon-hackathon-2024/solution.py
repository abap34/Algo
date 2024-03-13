import math
from collections import namedtuple

INF = 10**16

class UnionFind:
    def __init__(self, N):
        self.par = list(range(N))
        self.size = [1] * N

    def root(self, x):
        if self.par[x] == x:
            return x
        else:
            self.par[x] = self.root(self.par[x])
            return self.par[x]

    def issame(self, x, y):
        return self.root(x) == self.root(y)

    def unite(self, x, y):
        x = self.root(x)
        y = self.root(y)
        if x == y:
            return True
        if self.size[x] < self.size[y]:
            self.par[x] = y
            self.size[y] += self.size[x]
        else:
            self.par[y] = x
            self.size[x] += self.size[y]
        return True

Edge = namedtuple('Edge', ['from_', 'to', 'weight', 'profit'])

def reverse(edge):
    return Edge(edge.to, edge.from_, edge.weight, edge.profit)

class Graph:
    def __init__(self, N):
        self.edges = [[] for _ in range(N)]

    def all_edges(self):
        return [edge for edge_list in self.edges for edge in edge_list]

    def add(self, edge, has_dir=False):
        self.edges[edge.from_].append(edge)
        if not has_dir:
            self.edges[edge.to].append(reverse(edge))

def as_rooted_tree(graph, root):
    N = len(graph.edges)
    tree = Graph(N)
    stack = [(root, -1)]
    while stack:
        v, p = stack.pop()
        for u in graph.edges[v]:
            if u.to != p:
                tree.add(u, has_dir=True)
                stack.append((u.to, v))
    return tree

def kruskal(sorted_edges, N):
    uf = UnionFind(N)
    graph = Graph(N)
    cost = 0
    profit = -1
    for edge in sorted_edges:
        if not uf.issame(edge.from_, edge.to):
            uf.unite(edge.from_, edge.to)
            graph.add(edge)
            cost += edge.weight
            profit = max(profit, edge.profit)
    return graph, cost, profit

class LCA:
    def __init__(self, graph, root=0):
        V = len(graph.edges)
        K = math.ceil(math.log2(V))
        tree = as_rooted_tree(graph, root)
        self.parent = [[-1] * V for _ in range(K)]
        self.dist = [[-1] * V for _ in range(K)]
        self.depth = [-1] * V
        self.K = K
        self.V = V
        stack = [(root, -1, 0)]
        while stack:
            v, p, d = stack.pop()
            self.depth[v] = d
            self.parent[0][v] = p
            for u in tree.edges[v]:
                if u.to != p:
                    self.dist[0][u.to] = u.weight
                    stack.append((u.to, v, d + 1))
        for k in range(K - 1):
            for v in range(V):
                if self.parent[k][v] != -1:
                    self.parent[k + 1][v] = self.parent[k][self.parent[k][v]]
                    self.dist[k + 1][v] = max(self.dist[k][v], self.dist[k][self.parent[k][v]])

    def max_cost(self, u, v):
        cost = -INF
        if self.depth[u] < self.depth[v]:
            u, v = v, u
        diff = self.depth[u] - self.depth[v]
        for k in range(self.K):
            if (diff >> k) & 1:
                cost = max(cost, self.dist[k][u])
                u = self.parent[k][u]
        if u == v:
            return cost
        for k in range(self.K - 1, -1, -1):
            if self.parent[k][u] != self.parent[k][v]:
                cost = max(cost, self.dist[k][u])
                cost = max(cost, self.dist[k][v])
                u = self.parent[k][u]
                v = self.parent[k][v]
        cost = max(cost, self.dist[0][u])
        cost = max(cost, self.dist[0][v])
        return cost

def main():
    N, K, C = map(int, input().split())
    graph = Graph(N)
    for _ in range(K):
        u, v, w, p = map(int, input().split())
        u -= 1
        v -= 1
        edge = Edge(u, v, w, p)
        graph.add(edge)
    sorted_edges = graph.all_edges()
    sorted_edges.sort(key=lambda x: x.weight)
    mst, C_m, P_m = kruskal(sorted_edges, N)
    mst_edges_set = set(mst.all_edges())
    mst_tree = as_rooted_tree(mst, 0)
    lca = LCA(mst_tree)
    sorted_edges.sort(key=lambda x: x.profit, reverse=True)
    for edge in sorted_edges:
        P = edge.profit
        if edge in mst_edges_set:
            C_add = 0
            C_rem = 0
        else:
            u, v = edge.from_, edge.to
            C_add = edge.weight
            C_rem = lca.max_cost(u, v)
        if C_m + C_add - C_rem <= C:
            print(P)
            return
    print(-1)

if __name__ == "__main__":
    main()
