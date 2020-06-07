#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
using BigInt = long long;
#define ALL(a)  (a).begin(),(a).end()

int main(){
    int N;
    cin >> N;
    rep(i, 8){
        if (pow(2, i) > N){
            cout << pow(2, (i - 1)) << endl;
            break;
        }
    }
}