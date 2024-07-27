#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
using Graph = vector<vector<int>>;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
#define ALL(a) (a).begin(), (a).end()

template <class Abel>
struct BIT {
    vector<Abel> dat;
    Abel UNITY_SUM = 0;  // to be set

    /* [1, n] */
    BIT(int n) { init(n); }
    void init(int n) {
        dat.resize(n + 1);
        for (int i = 0; i < (int)dat.size(); ++i) dat[i] = UNITY_SUM;
    }

    /* a is 1-indexed */
    inline void add(int a, Abel x) {
        for (int i = a; i < (int)dat.size(); i += i & -i) dat[i] = dat[i] + x;
    }

    /* [1, a], a is 1-indexed */
    inline Abel sum(int a) {
        Abel res = UNITY_SUM;
        for (int i = a; i > 0; i -= i & -i) res = res + dat[i];
        return res;
    }

    /* [a, b), a and b are 1-indexed */
    inline Abel sum(int a, int b) { return sum(b - 1) - sum(a - 1); }

    /* k-th number (k is 0-indexed) */
    int get(long long k) {
        ++k;
        int res = 0;
        int N = 1;
        while (N < (int)dat.size()) N *= 2;
        for (int i = N / 2; i > 0; i /= 2) {
            if (res + i < (int)dat.size() && dat[res + i] < k) {
                k = k - dat[res + i];
                res = res + i;
            }
        }
        return res + 1;
    }
};

int main() {
    int N, Q;
    cin >> N >> Q;
    vector<int> A(N);
    rep(i, N) cin >> A[i];

    // sort
    sort(ALL(A));

    vector<int> B(Q + 1);
    vector<int> K(Q + 1);

    rep(i, Q) { cin >> B[i] >> K[i]; }

    int A_min = A[0];

    B[Q] = A_min - 1;
    K[Q] = 1;

    vector<int> indices(Q + 1);
    iota(ALL(indices), 0);
    sort(ALL(indices), [&](int i, int j) { return B[i] < B[j]; });

    vector<int> sorted_B(Q + 1);
    vector<int> sorted_K(Q + 1);

    rep(i, Q + 1) {
        sorted_B[i] = B[indices[i]];
        sorted_K[i] = K[indices[i]];
    }

    int _B_min = sorted_B[0];
    rep(i, N) { A[i] -= _B_min; }
    rep(i, Q) { B[i] -= _B_min; }
    rep(i, Q + 1) { sorted_B[i] -= _B_min; }

    // BIT に、 sorted_B[0] からの差を入れる
    BIT<int> bit(100000);

    rep(i, N) {
        bit.add(A[i] - sorted_B[0], 1);
    }

    // (b, k) -> ans
    map<pair<int, int>, int> ans;

    // sorted_B の 1番目から解いていく
    int before_idx = 0;
    int before_b = sorted_B[0];
    int B_min = sorted_B[0];

    auto get_topk = [&](int k) { return bit.get(k); };

    vector<bool> moved(N, false);
    for (int i = 1; i < N; i++) {
        int current_b = sorted_B[i];
        int diff = current_b - before_b;

        int insert_idx = lower_bound(ALL(A), current_b) - A.begin();

        for (int j = before_idx; j < insert_idx; j++) {
            moved[j] = true;
            bit.add(A[j] - sorted_B[0], -1);
            bit.add(A[j] - current_b + diff, 1);
        }

        rep(j, N) cout << get_topk(j) << " ";

        int k = sorted_K[i];
        int ans_val = bit.get(k) - current_b;
        
        before_idx = insert_idx;
        before_b = current_b;

        ans[{current_b, k}] = ans_val;
    }

    // show ans
    for (auto [key, val] : ans) {
        cout << "(" << key.first << ", " << key.second << ") -> " << val
             << endl;
    }

    rep(i, Q) { cout << ans[{B[i], K[i]}] << endl; }
}
