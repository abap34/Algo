#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)

int main(){
    map<char,char> A;
    char s;
    A['A'] = 'T';
    A['T'] = 'A';
    A['G'] = 'C';
    A['C'] = 'G';
    cin >> s;
    cout << A[s] << endl;
}