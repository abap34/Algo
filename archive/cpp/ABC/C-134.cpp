#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)

template <typename T>
T maximum(vector<T> A,int idx){
    sort(A.begin(),A.end());
    reverse(A.begin(),A.end());
    return A[idx];
}


int main(){
    int N,A_max,A_sec;
    cin >> N;
    vector<int> A(N);
    rep(i,N) cin >> A[i];
    A_max = maximum(A,0);
    A_sec = maximum(A,1);
    rep(i,N){
        if (A[i] == A_max){
            cout << A_sec << endl;
        } else {
            cout << A_max << endl;
        }
    }
}