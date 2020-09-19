#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
using Graph = vector<vector<int>>;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
#define ALL(a)  (a).begin(),(a).end()

int cld(int a, int b){
    return (a + (b - 1)) / b;
}


int main(){
    int N, A, B, C, D;
    cin >> N >> A >> B >> C >> D;
    int X, Y;
    X = cld(N, A) * B;
    Y = cld(N, C) * D;
    cout << min(X, Y) << endl;
}