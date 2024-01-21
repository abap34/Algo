import networkx as nx

def main():
    D = nx.Graph()
    N = int(input())
    for i in range(N):
        D.add_node(i)
    for i in range(N-1):
        d = list(map(int, input().split()))
        for j in range(len(d)):
            D.add_edge(i, i+j+1, weight=d[j])
            D.add_edge(i+j+1, i, weight=d[j])
    M = nx.max_weight_matching(D)
    print(sum([D[i][j]['weight'] for i, j in M]))


if __name__ == '__main__':
    main()


