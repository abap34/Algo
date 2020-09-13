#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
using Graph = vector<vector<int>>;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
#define ALL(a)  (a).begin(),(a).end()


int score(vector<int> X, int p){
    int max_time = -1;
    for (int x : X) max_time = max(abs(p - x), max_time);
    return max_time;
}

int main(){
    int N;
    cin >> N;
    vector<int> x(N);
    rep(i, N) cin >> x[i];
    int min_time = 1000000000;
    rep(i, 2000) {
        min_time = min(min_time, score(x, i));
    }
    cout << min_time << endl;
}