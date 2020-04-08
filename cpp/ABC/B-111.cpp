#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)


int main(){
    int N;
    cin >> N;
    for (int i = 1; i < 10; i++){
        int x = 111 * i;
        if (x >= N){
            cout << x << endl;
            return 0;
        }
    }
}