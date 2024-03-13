#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
using Graph = vector<vector<int>>;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
#define ALL(a)  (a).begin(),(a).end()



int main(){
    int L, x;
    stack<int> C;
    set<int> seen;
    cin >> L;
    rep(i, L){
        cin >> x;
        if (x > 0){ 
            if (seen.count(x)){
                cout << i + 1 << endl;
                return 0;
            }
            seen.insert(x);
            C.push(x);
        } else {
            if (C.empty() or -x != C.top()){
                cout << i + 1 << endl;
                return 0;
            } 
            seen.erase(-x);
            C.pop();
        }
    }
    cout << "OK" << endl;
}