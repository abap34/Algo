#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)


int main(){
    int N;
    cin >> N;
    float ans = 0;
    rep(i,N){
        float x;
        string s;
        cin >> x >> s;
        (s == "JPY") ? (ans += x) : (ans += (x * 380000));
    }
    cout << ans << endl;
}