#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
using Graph = vector<vector<int>>;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
#define ALL(a)  (a).begin(),(a).end()


int main(){
    int A, B, C, D, E, F;
    cin >> A;
    cin >> B;
    cin >> C;
    cin >> D;
    cin >> E;
    cin >> F;
    cout << (A + B + C + D + E + F) - min({A, B, C, D}) - min({E, F}) << endl;
}