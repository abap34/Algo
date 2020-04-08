#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)

int sum(vector<int> A,int N){
    int res = 0;
    rep(i,N) res += A[i];
    return res;
}

template <typename T>
int minimum(vector<T> A){
    int m = 100000;
    for (T a : A) if (a < m) m = a;
    return m;
    }




int main(){
    int N,X;
    cin >> N >> X;
    int ans = 0;
    vector<int> A(N);
    rep(i,N) cin >> A[i];
    ans += N;
    X -= sum(A,N);
    int min_A = minimum(A);
    ans += X / min_A;
    cout << ans << endl;
}
