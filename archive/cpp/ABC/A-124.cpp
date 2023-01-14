#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)

int main(){
    int A,B,ans;
    cin >> A >> B;
    ans = 0;
    if (A > B) {
        ans += A;
        A--;
    } else {
        ans += B;
        B--;
    }
    if (A > B) {
        ans += A;
        A--;
    } else {
        ans += B;
        B--;
    }
    cout << ans << endl;
}