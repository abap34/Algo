#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
#define ALL(a)  (a).begin(),(a).end()

int main(){
    int N;
    cin >> N;
    map <string,int> table;
    int max_count = -1;
    rep(i,N) {
        string s;
        cin >> s;
        if (table.count(s)){
            table[s] += 1;
        } else {
            table[s] = 1;
        }
        max_count = max(max_count,table[s]);
    }
    for (auto t : table){
        if (t.second == max_count){
            cout << t.first << endl;
        }
    }
}