#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
using Graph = vector<vector<int>>;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
#define ALL(a)  (a).begin(),(a).end()

int main(){
    int S;
    cin >> S;
    int bef = S / 100;
    int aft = S % 100;
    if ((bef > 12) or (bef == 0)){
        if ((aft > 12) or (aft == 0)) {
            cout << "NA" << endl;
        } else {
            cout << "YYMM" << endl;
        }
    } else {
        if ((aft > 12) or (aft == 0)){
            cout << "MMYY" << endl;
        } else {
            cout << "AMBIGUOUS" << endl;
        }
    }
}