#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
using Graph = vector<vector<int>>;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
#define ALL(a)  (a).begin(),(a).end()




int main(){
    int N;
    string S;
    cin >> N;
    cin >> S;
    for (char s : S){
        if (s == 'J') cout << 'J';
    }
    for (char s : S){
        if (s == 'O') cout << 'O';
    }
    for (char s : S){
        if (s == 'I') cout << 'I';
    }
    cout << endl;
}