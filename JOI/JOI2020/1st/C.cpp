#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
using Graph = vector<vector<int>>;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
#define ALL(a)  (a).begin(),(a).end()

bool isThere(vector<int> Arr, int key){
    for (int value : Arr){
        if (value == key) return true;
    }
    return false;
}

int main(){
    int N, M;
    cin >> N >> M;
    vector<int> A(N);
    rep(i, N) cin >> A[i];
    vector<int> B(M);
    rep(i, M) cin >> B[i];
    for (int i = 1; i < 101; i++){
        if (isThere(A, i) && isThere(B, i)) cout << i << endl;
    }

}