#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)

int main(){
    int N,A,B;
    cin >> N >> A >> B;
    cout << min(N * A, B) << endl;
}