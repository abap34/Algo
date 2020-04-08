#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)

int main(){
    string S;
    cin >> S;
    if ((S[0] == S[1] && S[1] == S[2]) or (S[1] == S[2] && S[2] == S[3])){
        cout << "Yes" << endl;
    } else {
        cout << "No" << endl;
    }
}