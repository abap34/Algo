#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
using Graph = vector<vector<int>>;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
#define ALL(a)  (a).begin(),(a).end()



int main(){
    cout << fixed << setprecision(5);
    double a, t, r;
    cin >> a >> t >> r;
    cout << r * (double)(t / a) << endl;
}