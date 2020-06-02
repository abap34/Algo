#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
using BigInt = long long;
#define ALL(a)  (a).begin(),(a).end()

int main(){
    string a, b;
    cin >> a >> b;
    int n = stoi(a + b);
    if (sqrt(n) == (int)sqrt(n)){
        cout << "Yes" << endl;
    } else {
        cout << "No" << endl;
    }
}