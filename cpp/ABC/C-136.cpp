#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
using BigInt = long long;
#define ALL(a)  (a).begin(),(a).end()

int main(){
    int N;
    cin >> N;
    vector<int> H(N);
    rep(i,N) cin >> H[i];
    for (int i = N-1; i > 0; i--){
        int h = H[i] - H[i - 1];
        if (h < -1){
            cout << "No" << endl;
            return 0;
        } else if (h == -1){
            H[i-1]--;
        } 
    }
    cout << "Yes" << endl;
}