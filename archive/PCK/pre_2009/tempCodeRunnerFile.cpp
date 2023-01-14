#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
using Graph = vector<vector<int>>;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
#define ALL(a) (a).begin(), (a).end()


template <typename T>
void cout_vector(vector<T> A){
    for (auto a : A){
        for (auto aa : a){
            cout << aa;
        }
        cout << endl;
    }
cout << endl;
}

int main()
{   
    
    while (true)
    {   
        
        int n;
        cin >> n;
        if(n == 0) break;
        vector<string> names(n);
        vector<vector<int>> teams(n, vector<int>(3));
        rep(i, n) {
            cin >> names[i];
            teams[i][2] = i;
            rep(j, n - 1) {
                int res;
                cin >> res;
                if (res == 0) {
                    teams[i][1] += 1;
                }
                else if (res == 1) {
                    teams[i][0] += 1;
                }
            }
        }
        sort(ALL(teams));
        for (auto team : teams) {
            cout << names[team[2]] << endl;
        }
    }
}