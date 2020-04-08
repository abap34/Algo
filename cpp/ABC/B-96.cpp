#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)



int main(){
    int A,B,C,K;
    cin >> A >> B >> C ;
    cin >> K;
    int ans = (A + B + C - max({A,B,C})) + (max({A,B,C})*(1 << K));
    cout << ans << endl;
}