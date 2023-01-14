#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)




int main(){
    string N;
    cin >> N;
    for (char n : N) n == '1' ? (cout << '9') : (cout << '1');
    cout << endl;
}