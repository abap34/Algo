#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)

int main(){
    int n,ans;
    ans = 0;
    cin >> n;
    vector<int> P(n);
    rep(i,n) cin >> P[i];
    rep(i,n-2) if (P[i] < P[i+1] && P[i+1] <  P[i+2]) ans ++;
    else if((P[i] > P[i+1]) && (P[i+1] > P[i+2])) ans++;
    cout << ans << endl;
}