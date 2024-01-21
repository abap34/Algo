import networkx as nx
import numpy as np
import matplotlib.pyplot as plt

def read_input():
    N = int(input())
    h = np.zeros((N - 1, N), dtype=np.int)
    for i in range(N - 1):
        h[i] = np.array(list(map(int, input().split())), dtype=np.int)
    
    v = np.zeros((N, N - 1), dtype=np.int)
    for i in range(N):
        v[i] = np.array(list(map(int, input().split())), dtype=np.int)

    d = np.zeros((N, N), dtype=np.int)
    for i in range(N):
        d[i] = np.array(list(map(int, input().split())), dtype=np.int)

    return N, h, v, d

def path_to_move(path):
    move = []
    for i in range(len(path) - 1):
        if path[i][0] == path[i + 1][0]:
            if path[i][1] < path[i + 1][1]:
                move.append('R')
            else:
                move.append('L')
        else:
            if path[i][0] < path[i + 1][0]:
                move.append('D')
            else:
                move.append('U')
    return move


def main():
    N, h, v, d = read_input()

    print(N)

    print(h)

    print(v)

    print(d)


    G = nx.Graph()

    for i in range(N - 1):
        for j in range(N - 1):
            G.add_node((i, j))

    for i in range(N):
        for j in range(N):
            if v[i][j] != 0:
                G.add_edge((i, j), (i, j + 1))
                G.add_edge((i, j + 1), (i, j))
            if h[i][j] != 0:
                G.add_edge((i, j), (i + 1, j))
                G.add_edge((i + 1, j), (i, j))


    # 巡回セールスマン問題を解く
    tsp = nx.algorithms.approximation.traveling_salesman_problem
    SA_tsp = nx.approximation.simulated_annealing_tsp
    method = lambda G, wt: SA_tsp(G, "greedy", weight=wt, temp=500)
    path = tsp(G,
               method=method,
    )

    print(''.join(path_to_move(path)))

main()

