#include <bits/stdc++.h>
using namespace std;
#define _GLIBCXX_DEBUG

int main(){
    int a,b;
    cin >> a >> b;
    if (b >= a) {
        cout << a << endl;
    } else {
        cout << a - 1 << endl;
    }
    return 0;
}