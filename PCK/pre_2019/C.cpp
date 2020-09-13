#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
using Graph = vector<vector<int>>;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
#define ALL(a)  (a).begin(),(a).end()

int main(){
    int N;
    cin >> N;
    int a = 1;
    
    while (2 * a <= N) a *= 2;

    cout << a << endl;
}