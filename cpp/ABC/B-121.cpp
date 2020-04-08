#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)


int main(){
    int N,M,C,ans;
    cin  >> N >> M >> C;
    vector<int> B(M);
    rep(i,M) cin >> B[i];
    rep(_,N){
        int s = 0;
        rep(j,M){
            int a;
            cin >> a;
            s += B[j] * a;
        }
        s += C;
        (s > 0) && (ans++);
    }
    cout << ans << endl;
}