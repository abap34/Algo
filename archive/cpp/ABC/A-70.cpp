#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
using Graph = vector<vector<int>>;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
#define ALL(a)  (a).begin(),(a).end()

int main(){
    string N;
    cin >> N;
    if (N[0] == N[2]) cout << "Yes" << endl;
    else cout << "No" << endl;
}