#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
int sum(vector<int> A){
    int res = 0;
    for (int a : A) res += a;
    return res;
}


int main(){
    int N;
    cin >> N;
    vector<int> L(N);
    rep(i,N) cin >> L[i];
    int sum_L = sum(L);
    rep(i,N){
        if (L[i] >= (sum_L - L[i])){ 
            cout << "No" << endl;
            return 0;
        }
         
    }
    cout << "Yes" << endl;
}