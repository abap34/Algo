#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
using Graph = vector<vector<int>>;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
#define ALL(a) (a).begin(), (a).end()

int solve() {
    int W, H, N, D, B;
    cin >> W >> H >> N >> D >> B;

    if (W == 0 && H == 0 && N == 0 && D == 0 && B == 0) {
        return 1;
    }

    vector<vector<int>> xy(W, vector<int>(H, 0));
    queue<pair<int, int>> q;
    rep(i, N) {
        int x, y;
        cin >> x >> y;
        if (i == B - 1) {
            q.push({x - 1, y - 1});
            continue;
        }

        xy[x - 1][y - 1] = 1;
    }

    int ans = 0;

    while (!q.empty()) {
        /* code */
        auto p = q.front();
        q.pop();
        ans++;
        
        rep(i, D) {
            pair<int, int> pp = {p.first - i - 1, p.second};
            if (pp.first < 0) {
                break;
            }
            if (xy[pp.first][pp.second] == 1) {
                q.push({pp.first, pp.second});
                xy[pp.first][pp.second] = 0;
            }
        }

        rep(i, D) {
            pair<int, int> pp = {p.first + i + 1, p.second};
            if (pp.first > W - 1) {
                break;
            }
            if (xy[pp.first][pp.second] == 1) {
                q.push({pp.first, pp.second});
                xy[pp.first][pp.second] = 0;
            }
        }

        rep(i, D) {
            pair<int, int> pp = {p.first, p.second - i - 1};
            if (pp.second < 0) {
                break;
            }
            if (xy[pp.first][pp.second] == 1) {
                q.push({pp.first, pp.second});
                xy[pp.first][pp.second] = 0;
            }
        }

        rep(i, D) {
            pair<int, int> pp = {p.first, p.second + i + 1};
            if (pp.second > H - 1) {
                break;
            }
            if (xy[pp.first][pp.second] == 1) {
                q.push({pp.first, pp.second});
                xy[pp.first][pp.second] = 0;
            }
        }
    }

    cout << ans << '\n';
    return 0;
}

int main() {
    while (solve() == 0) {
        /* code */
    }
}