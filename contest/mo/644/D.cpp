#include <bits/stdc++.h>

using namespace std;

const int MOD = 1e9 + 7;

int main() {
    int N;
    cin >> N;
    map<int, int> factors;
    for (int i = 1; i <= N; i++) {
        int n = i;
        for (int p = 2; p * p <= n; p++) {
            while (n % p == 0) {
                factors[p]++;
                n /= p;
            }
        }
        if (n != 1) {
            factors[n]++;
        }
    }
    long long ans = 1;
    for (auto p : factors) {
        ans = ans * (p.second + 1) % MOD;
    }
    cout << ans << endl;
    return 0;
}

