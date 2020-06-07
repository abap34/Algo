#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
using bigint = long long;
#define ALL(a)  (a).begin(),(a).end()

int main(){
    int N;
    int alice = 0;
    int bob = 0;
    cin >> N;
    vector<int> A(N);
    rep(i, N) cin >> A[i] ;
    sort(ALL(A));
    reverse(ALL(A));
    rep(j, N){
        if  (j % 2 == 0) {
            alice += A[j];
        } else {
            bob += A[j];
        }
    }
    cout << (alice - bob) << endl;
}