#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
using Graph = vector<vector<int>>;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
#define ALL(a)  (a).begin(),(a).end()

map<int, int> memo;


int fib(int n){
    if (n == 0 or n == 1) {
        return 1;
    } else {
        if (memo.find(n) != memo.end()){
            return memo[n];
        } else {
            memo[n] =  fib(n - 1) + fib(n - 2);
            return memo[n];
        }
    }
}

int main(){
    int N;
    cin >> N;
    cout << fib(N) << endl;
}