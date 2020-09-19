#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
using Graph = vector<vector<int>>;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
#define ALL(a)  (a).begin(),(a).end()

int main(){
    int A, B, C, D, E;
    cin >> A;
    cin >> B;
    cin >> C;
    cin >> D;
    cin >> E;
    if (A > 0){
        cout << (B - A) * E << endl;
    } else if (A == 0){
        cout << D + B * E << endl;
    } else {
        cout << (-A * C) + D + (B * E) << endl;
    }
    return 0;
}