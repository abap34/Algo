/*
validation
*/

#include <bits/stdc++.h>
#include "testlib.h"
using namespace std;

using ll = long long;

const ll Nmin = 1, Nmax = pow(10, 5);
const ll Kmin = 1, Kmax = pow(10, 5);
const ll wmin = 1, wmax = pow(10, 10);
const ll pmin = 1, pmax = pow(10, 10);
const ll Cmin = 1, Cmax = pow(10, 15);

bool is_connected(vector<vector<ll>> &G, ll N)
{
    vector<bool> seen(N, false);
    queue<ll> que;
    que.push(0);
    seen[0] = true;
    ll cnt = 0;
    while (!que.empty())
    {
        ll now = que.front();
        que.pop();
        cnt++;
        for (auto next : G[now])
        {
            if (seen[next])
                continue;
            seen[next] = true;
            que.push(next);
        }
    }
    return cnt == N;
}

int main()
{
    registerValidation();

    ll N = inf.readLong(Nmin, Nmax, "N");
    inf.readSpace();
    ll K = inf.readLong(Kmin, Kmax, "K");
    inf.readSpace();
    ll C = inf.readLong(Cmin, Cmax, "C");
    inf.readEoln();

    vector<vector<ll>> G(N);
    set<pair<ll, ll>> seen;

    for (ll i = 0; i < K; i++)
    {
        ll u = inf.readLong(1, N, "u");
        inf.readSpace();
        ll v = inf.readLong(1, N, "v");
        inf.readSpace();
        ll w = inf.readLong(wmin, wmax, "w");
        inf.readSpace();
        ll p = inf.readLong(pmin, pmax, "p");

        u--;
        v--;

        ensuref(u != v, "自己ループが存在します");

        G[u].push_back(v);
        G[v].push_back(u);

        ensuref(seen.count({u, v}) == 0, "多重辺が存在します");
        ensuref(seen.count({v, u}) == 0, "多重辺が存在します");

        seen.insert({u, v});
        seen.insert({v, u});

        inf.readEoln();
    }

    ensuref(is_connected(G, N), "グラフが連結ではありません");

    inf.readEof();

    return 0;
}