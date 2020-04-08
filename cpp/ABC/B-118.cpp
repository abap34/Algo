#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)


int main(){
    int N,M;
    int ans = 0;
    cin >> N >> M;
    vector<int> like_foods(M,0);

    rep(i,N){
        int k;
        cin >> k;
        vector<int> A(k);
        rep(j,k) cin >> A[j];
        for (int a : A){
            like_foods[a-1] += 1;
        }
    }
    for (int food : like_foods){
        if (food == N){
            ans++;
        }
    }
    cout << ans << endl;
}