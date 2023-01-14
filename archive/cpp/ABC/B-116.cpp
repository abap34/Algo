#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)

int f(int n){
    if (n % 2 == 0){
        return n / 2;
    } else {
        return 3 * n + 1;
    }
}

bool in(vector<int> A, int key){
    for (int a : A) if (a == key) return true;
    return false;
}

int main(){
    int s;
    vector<int> A;
    cin >> s;
    rep(i,1000000) {
        if (in(A,s)) {
            cout << (i + 1) << endl;
            return 0;
        }

        A.push_back(s);
        s = f(s);
    }
    
}