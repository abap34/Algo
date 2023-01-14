#include <bits/stdc++.h>
using namespace std;
#define _GLIBCXX_DEBUG

int main(){
    int a,b,c,d;
    cin >> a >> b >> c >> d;
    if (
        (abs(a - b) <= d) 
        or 
        (
            (a <= c <= b) 
        and 
        (abs(a - c) <= d) 
        and 
        (abs(c - b) <= d)
        )
        ) {
        cout << "Yes" << endl;
    } else {
        cout << "No" << endl;
    }
    return 0;
}