#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
using BigInt = long long;
#define ALL(a)  (a).begin(),(a).end()

int main(){
    int N,T,A;
    cin >> N;
    vector<int> H(N);
    cin >> T >> A;
    rep(i,N) cin >> H[i];
    BigInt err = 10000000000;
    int ans;
    for (int j = 0; j < N; j++){
        int tmp = T - H[j] * 0.006;
        if (err > abs(A - tmp)) ans = j + 1;
    }
    cout << ans << endl;
} 
