#include <bits/stdc++.h>
#define _GLIBCXX_DEBUG
using namespace std;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
#define ALL(a) (a).begin(), (a).end()

bool isOk(vector<int> H, vector<int> S, int N, long long P)
{
    vector<long long> lims(N);
    for (int i = 0; i < N; i++)
    {
        if (P - H[i] < 0) {
            return false;
        } else {
            lims[i] = (P - H[i]) / S[i];
        }
    }
    sort(ALL(lims));
    for (int i = 0; i < N; i++) {
        if (lims[i] < i) return false;
    }
    return true;
}

int main()
{
    ios::sync_with_stdio(false);
    cin.tie(nullptr);
    int N;
    cin >> N;
    vector<int> H(N);
    vector<int> S(N);
    rep(i, N) cin >> H[i] >> S[i];
    long long left = -1;
    long long right = 1e15 + 1e9 + 1;
    while (right - left > 1)
    {
        long long mid = (left + right) / 2;
        if (isOk(H, S, N, mid)) right = mid;
        else left = mid;
    }
    cout << right << endl;
    return 0;
}