#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)

int main(){
    int A,B,C,D;
    cin >> A >> B >> C >> D;
    int L = A + B;
    int R = C + D;
    if (L > R){
        cout << "Left" << endl;
    } else if (L == R){
        cout << "Balanced" << endl;
    } else {
        cout << "Right" << endl;
    }
}