#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
#define ALL(a)  (a).begin(),(a).end()

template <typename T>
void cout_vector(vector<T> A){
    for (T a : A) cout << a << " ";
cout << endl;
}

vector<bool> seen;
vector<int> d(101);
vector<int> f(101);

struct edge
{
    vector<int> from;
    vector<int> to;
};

using Graph = vector<edge>;

int t = 1;

void dfs(Graph &G, int v){
    d[v] = t;
    t++;
    seen[v] = true;
    for (auto next_v : G[v].to){
        if (seen[next_v]) continue;
        dfs(G, next_v);
    }
    f[v] = t;
    t++;
}

int main(){
    int N;
    cin >> N;
    Graph G(N);
    rep(i, N){
        int u, k;
        cin >> u >> k;
        rep(j, k) {
            edge e;
            int to;
            cin  >> to;
            G[u - 1].to.push_back(to - 1);
            G[to - 1].from.push_back(to - 1);
        }
    }

    seen.assign(N, false); 
    rep(i, N) if (!seen[i]) dfs(G, i);
    rep(i, N){
        cout << i + 1 << " " << d[i] << " " << f[i] << endl;
    }
}