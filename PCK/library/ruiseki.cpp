#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
using Graph = vector<vector<int>>;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
#define ALL(a)  (a).begin(),(a).end()


}

int main(){
    int N;
    cin >> N;
    vector<long long> A(N);
    rep(i, N) cin >> A[i];
    vector<long long> R(N + 1);
    R[0] = 0;
    for (int i = 0; i < N; i++) {
        R[i + 1] = R[i] + A[i];
    }


    for (int k = 1; k <= N; k++){
        long long ans = -1;
        rep(i, N - k + 1){
            ans = max(ans, R[i + k] - R[i]);
        }
        cout << ans << endl;
    }
}