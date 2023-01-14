#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)


int main(){
    int H,W,h,w;
    cin >> H >> W;
    cin >> h >> w;
    cout << ((H - h) * (W - w)) << endl;
}