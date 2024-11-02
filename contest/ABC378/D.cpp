#pragma GCC target("avx2")
#pragma GCC optimize("O3")
#pragma GCC optimize("unroll-loops")

#include <iostream>
#include <string>
#include <unordered_map>
#include <vector>

using namespace std;

int H, W, K;
vector<string> S;

inline long long encode_key(int i1, int j1, int i2, int j2) {
    return ((long long)i1 << 48) | ((long long)j1 << 32) |
           ((long long)i2 << 16) | j2;
}

inline int dfs(int x, int y, int k, int l, int s, vector<vector<int>>& visited,
               int visit_mark) {
    if (x == k && y == l && s == K) {
        return 1;
    } else if (s >= K) {
        return 0;
    }

    visited[x][y] = visit_mark;
    int paths = 0;

    if (x + 1 < H && visited[x + 1][y] != visit_mark && S[x + 1][y] == '.') {
        paths += dfs(x + 1, y, k, l, s + 1, visited, visit_mark);
    }
    if (x - 1 >= 0 && visited[x - 1][y] != visit_mark && S[x - 1][y] == '.') {
        paths += dfs(x - 1, y, k, l, s + 1, visited, visit_mark);
    }
    if (y + 1 < W && visited[x][y + 1] != visit_mark && S[x][y + 1] == '.') {
        paths += dfs(x, y + 1, k, l, s + 1, visited, visit_mark);
    }
    if (y - 1 >= 0 && visited[x][y - 1] != visit_mark && S[x][y - 1] == '.') {
        paths += dfs(x, y - 1, k, l, s + 1, visited, visit_mark);
    }

    visited[x][y] = 0;  
    return paths;
}

inline int count(int i, int j, int k, int l, vector<vector<int>>& visited,
                 int visit_mark, unordered_map<long long, int>& cache) {
    long long key = encode_key(i, j, k, l);
    long long reverse_key = encode_key(k, l, i, j);

    if (cache.count(key)) return cache[key];
    if (cache.count(reverse_key)) return cache[reverse_key];

    if (S[i][j] == '#' || S[k][l] == '#') return 0;

    int result = dfs(i, j, k, l, 0, visited, visit_mark);
    cache[key] = result;
    cache[reverse_key] = result;  
    return result;
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);

    cin >> H >> W >> K;
    S.resize(H);
    for (int i = 0; i < H; ++i) {
        cin >> S[i];
    }

    vector<vector<int>> visited(
        H, vector<int>(W, 0));  
    int ans = 0;
    int visit_mark = 1;  
    unordered_map<long long, int> cache;

    for (int from_i = 0; from_i < H; ++from_i) {
        for (int from_j = 0; from_j < W; ++from_j) {
            for (int to_i = 0; to_i < H; ++to_i) {
                for (int to_j = 0; to_j < W; ++to_j) {
                    ans += count(from_i, from_j, to_i, to_j, visited,
                                 visit_mark++, cache);
                }
            }
        }
    }

    cout << ans << endl;
    return 0;
}
