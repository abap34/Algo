#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)


int f(int a, int b){
    int ans = max((int)(log10(a) + 1),(int)(log10(b) + 1));
    return ans;
}



int main(){
    int N;
    int ans;
    cin >> N;
    ans = 11;
    for (int i = 1; i < sqrt(N); i++){
        if (N % i == 0){
            if (f(i,N/i) < ans) ans = f(i,N/i);
        }
    }
    cout << ans << endl;
    return 0;
}