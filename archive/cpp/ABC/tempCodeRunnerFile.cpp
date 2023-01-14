#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
using BigInt = long long;
#define ALL(a)  (a).begin(),(a).end()


int sum(vector<int> A){
    int res = 0;
    for (int a : A){
        res += a;
    }
    return res;
}

int main(){
    int N;
    cin >> N;
    vector<int> W(N);
    rep(i,N) cin >> W[i];
    int best_weight = (double)sum(W) / 2;
    int before_sum = 0;
    int ans;
    for (int w : W) {
        before_sum += w;
        if (before_sum > best_weight){
            ans = min(abs(best_weight - before_sum),abs(best_weight - (before_sum - w)));
            break;
        }
    }
    cout << (int)(ans * 2) << endl;
}