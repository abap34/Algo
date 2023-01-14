#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
using BigInt = long long;
using BigFloat = long double;
#define ALL(a)  (a).begin(),(a).end()

int main(){
    BigFloat W,H,x,y;
    cin >> W >> H >> x >> y;
    if (W / 2 == x && H / 2 == y){
        cout << W * H / 2 << " " << 1 << endl;
    } else {
        cout << W * H / 2 << " " << 0 << endl;
    }
}