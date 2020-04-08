#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)

int main(){
    int N,max_height,ans;
    max_height = 0;
    ans = 0;
    cin >> N;
    rep(i,N){
        int h;
        cin >> h;
        if (h >= max_height){
            max_height = h;
            ans++;
        } 
    }   
    cout << ans << endl;
}