#include <bits/stdc++.h>
using namespace std;
#define _GLIBCXX_DEBUG

int main(){
    string s;
    cin >> s;
    sort(s.begin(), s.end());   
    s.erase(unique(s.begin(), s.end()), s.end());
    if (s == "abc"){
        cout << "Yes" << endl;
    } else {
        cout << "No" << endl;
    }
}