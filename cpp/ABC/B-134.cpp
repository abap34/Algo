#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
using BigInt = long long;
#define ALL(a)  (a).begin(),(a).end()


int cld(int a,int b){
    return (a + (b - 1)) / b;
}

int main(){
    int N,D;
    cin >> N >> D;
    cout << cld(N,2 * D + 1) << endl;
}