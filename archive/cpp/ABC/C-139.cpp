#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
#define ALL(a)  (a).begin(),(a).end()

int main(){
    int N;
    cin >> N;
    vector<int> H(N+2);
    H[0] = 1000000001;
    H[N+1] = 1000000001;
    rep(i,N) cin >> H[i + 1];
    int ans = -1;
    int res = -1;
    for (int i = 0; i < N + 1; i++){
        if (H[i] >= H[i + 1]){
            res++;
        } else {
            H[i] = 1000000001;
            res = 0;
        }
        if (res > ans) ans = res;
    }
    cout << ans << endl;
}