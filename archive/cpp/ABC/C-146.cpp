#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
using BigInt = long long;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
#define ALL(a)  (a).begin(),(a).end()

BigInt f(BigInt n,BigInt a,BigInt b){
    int k =  (int)(log10(n) + 1);
    return a * n + b * k;
}


int main(){
    BigInt A,B,X;
    cin >> A >> B >> X;
    BigInt left = 0;
    BigInt right = pow(10,9) + 1;
    while (right - left > 1)
    {
        BigInt mid = (left + right) / 2;
        if (f(mid,A,B) > X) right = mid;
        else left = mid;
    }
    cout << left << endl;
}