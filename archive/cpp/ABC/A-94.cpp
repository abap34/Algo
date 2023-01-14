#include <bits/stdc++.h>
using namespace std;
#define _GLIBCXX_DEBUG

int main(){
    int A,B,X,min_cat,max_cat;
    cin >> A >> B >> X;
    min_cat = A;
    max_cat = A + B;
    if (min_cat <= X and X <= max_cat){
        cout << "YES" << endl;
    } else
    {
        cout << "NO" << endl;
    }
    return 0;
}