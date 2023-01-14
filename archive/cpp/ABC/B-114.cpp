#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
using Graph = vector<vector<int>>;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
#define ALL(a) (a).begin(), (a).end()

int main() {
    string S;
    cin >> S;
    int ans = 10000000;
    for (int i = 0; i < S.length() - 2; i++)
    {
        int s = 0;
        s += (S[i] - '0') * 100;
        s += (S[i + 1] - '0') * 10;
        s += S[i + 2] - '0';
        ans = min(ans, abs(753 - s));
    }
    cout << ans << endl;
}