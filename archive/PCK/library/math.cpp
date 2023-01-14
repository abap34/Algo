#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
using Graph = vector<vector<int>>;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
#define ALL(a)  (a).begin(),(a).end()

int gcd(vector<int> A, int n){
    int ans = A[0];
    for (int i = 1; i < n; i++) ans = __gcd(ans, A[i]);
    return ans;
}

int __lcm(int a, int b){
    return a / __gcd(a, b) * b;
}

int lcm(vector<int> A, int n){
    int ans = A[0];
    for (int i = 1; i < n; i++) ans = __lcm(ans, A[i]);
    return ans;
}

bool is_prime(int n){
    if (n == 1) return false;
    for (int i = 2; i * i <= n; i++){
        if (n % i == 0) return false;
    }
    return true;
}

vector<int> divisors(int n){
    vector<int> ans;
    for(int i = 1; i * i <= n; i++){
        if (n % i == 0){
            ans.push_back(i);
            if (n / i != i) ans.push_back(n / i);
        }
    }
    // sort(ans.begin(), ans.end());
    return ans;
}

vector<int> factor(int n){
    vector<int> ans;
    for (int i = 2; i * i <= n; i++){
        while (n % i == 0){
            ans.push_back(i);
            n /= i;
        }
    }
    if (n != 1) ans.push_back(n);
    return ans;
}

int main(){
    vector<int> A = {24, 16, 48, 12};

    cout << "gcd(A) = " << gcd(A, A.size()) << endl;

    cout << "lcm(A) = " << lcm(A, A.size()) << endl;  

    rep(i, 10){
        if (is_prime(i)) cout << i << " is prime." << endl;
    }

    cout << "divisorts of 24 is " << endl;
    for (int d : divisors(24)){
        cout << d << " ";
    }

    cout << endl;

    cout << "factor of 144" << endl;
    for (int n : factor(144)){
        cout << n << " ";
    }
}