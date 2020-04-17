#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
#define ALL(a)  (a).begin(),(a).end()


int main(){
    int N,M;
    cin >> N >> M;
    vector<int> problems(N);
    vector<int> penalty(N);
    int AC = 0;
    int WA = 0;
    rep(i,M){
        int p;
        string S;
        cin >> p >> S;
        p--;                    // 0-based index
        bool isAC = problems[p];

        if (!(isAC)) {
            if (S == "AC"){
                AC ++;
                problems[p] = 1;
                WA += penalty[p];
            } else {
                penalty[p]++;
            }
        }
    }  
    cout << AC << " " << WA << endl;
}