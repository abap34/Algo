#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
using BigInt = long long;
#define ALL(a)  (a).begin(),(a).end()

double getTemp(int x, int T) {
    return (T - (double)x * 0.006);
}


int main(){
    int N, T, A;
    cin >> N;
    cin >> T >> A;
    vector<int> H(N);
    rep(i, N) cin >> H[i];
    double a = 1000000;
    double b;
    int ans_idx;
    rep(i, N) {
        b = abs(A - getTemp(H[i], T));
        if (a > b){
            ans_idx = i + 1;
            a = b;
        }
    }
    cout << ans_idx << endl;
} 
