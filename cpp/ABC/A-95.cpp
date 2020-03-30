#include <bits/stdc++.h>
using namespace std;
#define _GLIBCXX_DEBUG

int main(){
    string S;
    int price = 700;
    cin >> S;
    for (int i = 0; i <= 3; i++)
    {
        if (S[i] == 'o') price += 100;
    }
    cout << price << endl;
    return 0;
}