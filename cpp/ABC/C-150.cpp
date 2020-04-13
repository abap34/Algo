#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)


template <typename T>
void cout_vector(vector<T> A){
    for (T a : A) cout << a << " ";
cout << endl;
}
int main(){
    int N,p,q;
    cin >> N;
    vector<int> P(N);
    vector<int> Q(N);
    vector<int> A(N);
    rep(i,N) {
        cin >> P[i];
        A[i] = i + 1;
    }
    rep(i,N) cin >> Q[i];
    int idx = 0;
    vector<bool> flags = {false,false};
    do {
        idx++;
        if (P == A){
            p = idx;
            flags[0] = true;
        }; 
        if (Q == A){
            q = idx;
            flags[1] = true;
        }
        if (flags[0] && flags[1]) break;
    } while(next_permutation(A.begin(),A.end()));
    cout << abs(p - q) << endl;
}