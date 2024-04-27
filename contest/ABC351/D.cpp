#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;

unordered_map<pair<int, int>, unordered_set<pair<int, int>>> field_to_graph(const vector<vector<bool>>& field, int H, int W) {
    // B が false なら上下左右に辺が張られてるとみなす
    unordered_map<pair<int, int>, unordered_set<pair<int, int>>> G;

    for (int i = 1; i <= H; ++i) {
        for (int j = 1; j <= W; ++j) {
            // 上下左右を見て、B[i][j] が false なら辺を張る
            G[{i, j}] = {};

            // 自分が壁なら何もしない
            if (field[i-1][j-1]) {
                continue;
            }

            if (i > 1 && !field[i-2][j-1]) {
                G[{i, j}].insert({i - 1, j});
            }

            if (i < H && !field[i][j-1]) {
                G[{i, j}].insert({i + 1, j});
            }

            if (j > 1 && !field[i-1][j-2]) {
                G[{i, j}].insert({i, j - 1});
            }

            if (j < W && !field[i-1][j]) {
                G[{i, j}].insert({i, j + 1});
            }
        }
    }

    return G;
}

int main() {
    int H, W;
    cin >> H >> W;
    vector<vector<char>> A(H, vector<char>(W));

    for (int i = 0; i < H; ++i) {
        for (int j = 0; j < W; ++j) {
            cin >> A[i][j];
        }
    }

    vector<vector<bool>> B(H, vector<bool>(W, false));

    // 上下左右が '#' かどうか
    for (int i = 0; i < H; ++i) {
        for (int j = 0; j < W; ++j) {
            if (A[i][j] == '#') {
                B[i][j] = true;
            } else {
                if (i > 0 && A[i-1][j] == '#') {
                    B[i][j] = true;
                } else if (i < H-1 && A[i+1][j] == '#') {
                    B[i][j] = true;
                } else if (j > 0 && A[i][j-1] == '#') {
                    B[i][j] = true;
                } else if (j < W-1 && A[i][j+1] == '#') {
                    B[i][j] = true;
                }
            }
        }
    }

    auto G = field_to_graph(B, H, W);

    vector<vector<pair<int, int>>> groups;

    vector<vector<bool>> visited(H, vector<bool>(W, false));
    vector<pair<int, int>> stack;

    auto dfs = [&](int i, int j, vector<pair<int, int>>& group) {
        stack.push_back({i, j});

        while (!stack.empty()) {
            tie(i, j) = stack.back();
            stack.pop_back();

            if (visited[i-1][j-1]) {
                continue;
            }

            visited[i-1][j-1] = true;
            group.push_back({i, j});

            for (auto [ni, nj] : G[{i, j}]) {
                stack.push_back({ni, nj});
            }
        }
    };

    for (int i = 1; i <= H; ++i) {
        for (int j = 1; j <= W; ++j) {
            if (visited[i-1][j-1]) {
                continue;
            }

            vector<pair<int, int>> group;
            dfs(i, j, group);
            groups.push_back(group);
        }
    }

    int max_size = -1;

    for (auto& group : groups) {
        unordered_set<pair<int, int>> group_set(group.begin(), group.end());
        for (auto [i, j] : group) {
            if (B[i-1][j-1]) {
                continue;
            }

            if (i > 1 && B[i-2][j-1]) {
                group_set.insert({i - 1, j});
            }

            if (i < H && B[i][j-1]) {
                group_set.insert({i + 1, j});
            }

            if (j > 1 && B[i-1][j-2]) {
                group_set.insert({i, j - 1});
            }

            if (j < W && B[i-1][j]) {
                group_set.insert({i, j + 1});
            }
        }

        max_size = max(max_size, static_cast<int>(group_set.size()));
    }

    cout << max_size << endl;

    return 0;
}
