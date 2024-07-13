#include <iostream>
#include <limits>
#include <queue>
#include <vector>

using namespace std;

typedef pair<long long, int> P;  // (最短距離, 頂点)

struct Edge {
    int to;
    long long weight;
    Edge(int t, long long w) : to(t), weight(w) {}
};

void dijkstra(int start, const vector<vector<Edge>> &graph,
              vector<long long> &dist) {
    priority_queue<P, vector<P>, greater<P>> pq;
    pq.push(P(0, start));
    dist[start] = 0;

    while (!pq.empty()) {
        long long d = pq.top().first;
        int v = pq.top().second;
        pq.pop();

        if (d > dist[v]) continue;

        for (const auto &edge : graph[v]) {
            if (dist[edge.to] > dist[v] + edge.weight) {
                dist[edge.to] = dist[v] + edge.weight;
                pq.push(P(dist[edge.to], edge.to));
            }
        }
    }
}

int main() {
    int N, M;
    cin >> N >> M;

    vector<long long> A(N);
    for (int i = 0; i < N; ++i) {
        cin >> A[i];
    }

    vector<int> U(M), V(M);
    vector<long long> B(M);
    for (int i = 0; i < M; ++i) {
        cin >> U[i] >> V[i] >> B[i];
        --U[i];
        --V[i];
    }

    auto weight = [&A](int idx) { return A[idx]; };

    vector<vector<Edge>> graph(2 * N);

    for (int i = 0; i < N; ++i) {
        graph[i].emplace_back(i + N, 0);
    }

    for (int i = 0; i < M; ++i) {
        long long w1 = B[i] + weight(U[i]) + weight(V[i]);
        long long w2 = B[i] + weight(V[i]);
        long long w3 = B[i] + weight(U[i]);

        graph[U[i]].emplace_back(V[i], w1);
        graph[V[i]].emplace_back(U[i], w1);
        graph[U[i] + N].emplace_back(V[i], w2);
        graph[V[i] + N].emplace_back(U[i], w3);
    }

    vector<long long> dist(2 * N, numeric_limits<long long>::max());
    dijkstra(0, graph, dist);

    for (int i = 1; i < N; ++i) {
        cout << dist[i] + A[0] << " ";
    }
    cout << endl;

    return 0;
}
