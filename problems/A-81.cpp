#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)

int main(){
    string S;
    cin >> S;
    int ans = 0;
    for (char s : S) if (s == '1') ans ++;
    cout << ans << endl;
}