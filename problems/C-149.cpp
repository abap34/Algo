#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
#define ALL(a)  (a).begin(),(a).end()

bool isPrime(int N){
    for (int i = 2; i < sqrt(N); i++){
        if (N % i == 0) return false;
    }
    return true;
}


int main(){
    int X;
    cin >> X;
    while (true)
    {   if (isPrime(X)){
            cout << X << endl;
            return 0;
        }
        X++;
    }
}