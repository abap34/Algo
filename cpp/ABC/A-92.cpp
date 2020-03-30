#include <bits/stdc++.h>
using namespace std;
#define _GLIBCXX_DEBUG

int main(){
    int A,B,C,D;
    int price = 0;
    cin >> A;
    cin >> B;
    cin >> C;
    cin >> D;
    price += min(A,B);
    price += min(C,D);
    cout << price << endl;
}