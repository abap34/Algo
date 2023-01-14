#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)

template <typename T>
int maximum(vector<T> A){
    int m = -1;
    for (T a : A) if (a > m) m = a;
    return m;
}

int main(){
    int A,B,C;
    cin >> A >> B >> C;
    vector<int> D = {A,B,C};
    int max_value = maximum(D);
    cout << (A + B + C + 9 * max_value) << endl;
}