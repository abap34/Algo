#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
using Graph = vector<vector<int>>;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
#define ALL(a)  (a).begin(),(a).end()

map<int, char> p{
    {0, '+'},
    {1, '-'}
};

vector<char> ans(3);


int calc(int op, int a, int b){
    if (op == 1) return a - b;
    else return a + b;
}

bool solve(int op1, int op2, int op3, int a, int b, int c, int d){
    if ((calc(op3, calc(op2, calc(op1, a, b), c), d)) == 7) {
        ans = {p[op1], p[op2], p[op3]};
        return true;
    }
    return false;
}



int main(){
    string S;
    cin >> S;
    int A = S[0] - '0';
    int B = S[1] -'0';
    int C = S[2] - '0';
    int D = S[3] - '0';


    vector<int> Operators = {0, 1};

    for (int op1 : Operators){
        for (int op2 : Operators){
            for (int op3 : Operators){
                if (solve(op1, op2, op3, A, B, C, D)) break;
            }
        }
    }
    cout << A << ans[0] << B << ans[1] << C << ans[2] << D << "=7" << endl;
}