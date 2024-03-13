#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
using Graph = vector<vector<int>>;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
#define ALL(a)  (a).begin(),(a).end()

vector<bool> seen;
vector<int> counter;

template <typename T>
void cout_vector(vector<T> A)
{
    for (T a : A)
        cout << a << " ";
    cout << endl;
}

void dfs(const Graph &G, int c, int p){
    for (int j: G[c]){
        if (j != p){
            counter[j] += counter[c];
            dfs(G, j, c);
        }
    }
}


int main()
{
    int N, Q;
    cin >> N >> Q;
    seen.assign(N, false);
    counter.assign(N, 0);
    Graph G(N);
    for (int i = 0; i < N - 1; i++)
    {
        int a, b;
        cin >> a >> b;
        a--;
        b--;
        G[a].push_back(b);
        G[b].push_back(a);
    }
    for (int i = 0; i < Q; i++)
    {
        int p, x;
        cin >> p >> x;
        p--;
        counter[p] += x;
    }
    dfs(G, 0, -1);
    for (int n: counter){
        cout << n << " ";
        //
    }
    cout << "\n";
}
