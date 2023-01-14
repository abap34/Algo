#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
using Graph = vector<vector<int>>;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
#define ALL(a)  (a).begin(),(a).end()


void output(vector<string> field){
    for (auto f : field){
        cout << f << endl;
    }
}

int main(){
    int H, W;
    cin >> H >> W;
    vector<string> field(H);
    rep(i, H){
        cin >> field[i];
    }
    output(field);
    
    vector<bool> seen()
}