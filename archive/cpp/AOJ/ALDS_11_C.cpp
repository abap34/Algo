#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
#define ALL(a)  (a).begin(),(a).end()

struct edge
{
    vector<int> from;
    vector<int> to;
};

using Graph = vector<edge>;


int main(){
    int N;
    cin >> N;
    Graph G(N);
    rep(i, N){
        int u, k;
        cin >> u >> k;
        rep(j, k){
            int v;
            cin >> v;
            G[u - 1].to.push_back(v - 1);
            G[v - 1].from.push_back(v - 1);
        }
    }
    vector<int> dist(N, -1);
    queue<int> que;

    dist[0] = 0;
    que.push(0);

    while (!que.empty()){
        int v = que.front();
        que.pop();

        for (int next_v : G[v].to){
            if (dist[next_v] != -1) continue;

            dist[next_v] = dist[v] + 1;
            que.push(next_v);
        }
    }
    rep(i, N) cout << i + 1 << " " << dist[i] << endl;
}