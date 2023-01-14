#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
using Graph = vector<vector<int>>;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
#define ALL(a)  (a).begin(),(a).end()

int main(){
    int N;
    cin >> N;
    if (N < 65){
        cout << 0 << endl;
    } else if (N <= 90){
        cout << 1 << endl;
    } else if ((97 <= N) && (N<= 122)){
        cout << 2 << endl;
    } else {
        cout << 0 << endl;
    }
}