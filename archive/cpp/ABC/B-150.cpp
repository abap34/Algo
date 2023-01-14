#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)




int main(){
    int N,ans;
    ans = 0;
    cin  >> N;
    string S;
    cin >> S;
    for (int i=0; i <= N-3; i++) {
            if(S[i] == 'A' && S[i + 1] == 'B' && S[i + 2] == 'C') ans++;
    }
    cout << ans << endl;
    return 0;
}