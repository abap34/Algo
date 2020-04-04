#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)



int main(){
    int N,ans;
    ans = 0;
    cin >> N;
    for(int i = 1; i <= N; i++){
        if ((int)(log10(i) + 1) % 2 == 1) ans++;
    }
    cout << ans << endl;
    return 0;
}