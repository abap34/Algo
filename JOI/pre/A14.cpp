#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
using Graph = vector<vector<int>>;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
#define ALL(a)  (a).begin(),(a).end()

int main(){
    int A, B, C, D, P;
    cin >> A;
    cin >> B;
    cin >> C;
    cin >> D;
    cin >> P;

    int X = A * P;
    int Y;
    if (P > C){
        Y = B + (P - C) * D;
    } else {
        Y = B;
    }

    cout << min(X, Y) << endl;
}