#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
using Graph = vector<vector<int>>;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
#define ALL(a)  (a).begin(),(a).end()


int main(){
    int A, B, C;
    cin >> A >> B >> C;
    vector<int> ABC = {A, B, C};
    sort(ALL(ABC));
    cout << ABC[1] << endl;
}