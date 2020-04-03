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
vector<T> slice_vector(vector<T> A,int start_idx,int fin_idx){
    vector<T> res(fin_idx - start_idx);
    for (int i = start_idx; i < fin_idx; i++)
    {
        res[i-start_idx] = A[i];
    }
    return res;
}

int main(){
    int N,min_abs,a;
    cin >> N;
    vector<int> W(N);
    rep(i,N) cin >> W[i];
    min_abs = 10^10;
    rep(i,N) {
        vector<int> before(i);
        vector<int> after(N-i);
        int a;
        before = slice_vector(W,0,i);
        after = slice_vector(W,i+1,N);
        a = abs(sum(before,i) - sum(after,N-i));
        (a < min_abs) && (min_abs = a);
    }
    cout << min_abs << endl;
    return 0;
}

                  