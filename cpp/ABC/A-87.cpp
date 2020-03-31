#include <bits/stdc++.h>
using namespace std;
#define _GLIBCXX_DEBUG

int  main(){
    int X,A,B;
    cin >> X;
    cin >> A;
    cin >> B;
    X -= A;
    X -= (X / B) * B;
    cout << X << endl;
}