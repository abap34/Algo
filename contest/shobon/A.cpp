#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
using Graph = vector<vector<int>>;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
#define ALL(a)  (a).begin(),(a).end()

int main(){
    int N;
    cin >> N;

    if (N >= 2400 && N < 2800) {
        cout << "Yes" << endl;
    } else {
        cout << "No" << endl;
    }
}