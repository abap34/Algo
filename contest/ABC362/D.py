import networkx 
        
def main():
    N, M = map(int, input().split())
    A = list(map(int, input().split()))
    U = []
    V = []
    B = []

    for i in range(M):
        u, v, b = map(int, input().split())
        U.append(u - 1)
        V.append(v - 1)
        B.append(b)


    def weight(idx):
        return A[idx]

    

    G = networkx.DiGraph()
    for i in range(1, N):
        G.add_edge(i, i + N, weight=0)

    for i in range(M):
        G.add_edge(U[i], V[i], weight=B[i] + weight(U[i]) + weight(V[i]))
        G.add_edge(V[i], U[i], weight=B[i] + weight(U[i]) + weight(V[i]))

        
        G.add_edge(U[i] + N, V[i], weight=B[i] + weight(V[i]))
    
        G.add_edge(V[i] + N, U[i], weight=B[i] + weight(U[i]))

    
    dist = networkx.single_source_dijkstra_path_length(G, 0, weight='weight')

    for i in range(1, N):
        print(dist[i], end=' ')


    print()
        

main()