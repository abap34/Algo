#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)

int main(){
    int N,X,ans;
    cin >> N >> X;
    vector<int> L(N),D(N+1);
    D[0] = 0;
    ans = 0;
    rep(i,N) cin >> L[i];
    for (int i = 1; i < N+1; i++) D[i] = D[i-1] + L[i-1];
    rep(i,N+1) (D[i] <= X) && ans++;
    cout << ans << endl;
    return 0;
}