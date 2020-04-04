#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)


int factor(int n){
    int N;
    N = 0;
    for (int i = 1; i <= n; i++) (n % i == 0) && (N++); 
    return N;
}


int main(){
    int N,ans;
    ans = 0;
    cin >> N;
    for(int i = 1; i <= N; i++){
        if (i % 2 == 1 && factor(i) == 8) ans++;
    }
    cout << ans << endl;
}