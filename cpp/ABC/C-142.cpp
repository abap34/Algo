#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
#define ALL(a)  (a).begin(),(a).end()


int main(){
    int N;
    cin >> N;
    map<int,int> A;
    rep(i,N){
        int n;
        cin >> n;
        A[n] = i;
    }
    for (auto a : A){
        cout << (a.second + 1) << endl;
    }
}