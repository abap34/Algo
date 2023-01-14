#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
using Graph = vector<vector<int>>;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
#define ALL(a)  (a).begin(),(a).end()



int main(){
    string A, B, C;
    cin >> A >> B >> C;
    if ((A[A.size() - 1] == B[0]) and (B[B.size() - 1] == C[0])) cout << "YES" << endl;
    else cout << "NO" << endl;
}
