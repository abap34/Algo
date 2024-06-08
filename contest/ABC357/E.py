import sys
import networkx as nx

def initialize_graph(N, edges):
    G = nx.DiGraph()
    for i, j in enumerate(edges):
        G.add_edge(i + 1, j)
    return G

def find_cycles(G):
    return list(nx.simple_cycles(G))

def merge_cycles(G, cycles):
    c = -1
    for cycle in cycles:
        new_node = max(G.nodes) + 1  
        cycle_weight = len(cycle)  
        G.add_node(new_node, weight=cycle_weight)
        c = cycle_weight

        for node in cycle:
            preds = list(G.predecessors(node))
            succs = list(G.successors(node))
            G.remove_node(node)
            for pred in preds:
                if pred not in cycle:
                    G.add_edge(pred, new_node)
            for succ in succs:
                if succ not in cycle:
                    G.add_edge(new_node, succ)
    return G, c

def calculate_weights(G):
    topo_order = list(nx.topological_sort(G))
    for node in reversed(topo_order):
        preds = list(G.predecessors(node))
        for pred in preds:
            G.nodes[pred]['weight'] += G.nodes[node]['weight']

    total_weight = sum(nx.get_node_attributes(G, 'weight').values())
    return total_weight

def main():
    N = int(input())
    edges = [int(x) for x in input().split()]

    G = initialize_graph(N, edges)

    for node in G.nodes:
        G.nodes[node]['weight'] = 1

    total_weight = 0

    for component in nx.weakly_connected_components(G):
        subgraph = G.subgraph(component).copy()

        cycles = find_cycles(subgraph)
        subgraph, c = merge_cycles(subgraph, cycles)

    
        total_weight += calculate_weights(subgraph) + (c * (c - 1))

    print(total_weight)

if __name__ == "__main__":
    main()
