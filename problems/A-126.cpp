#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)


int main(){
    int N,K;
    cin >> N >> K;
    string S;
    cin >> S;
    S[K-1] = S[K-1] + 32;
    cout << S << endl;
}