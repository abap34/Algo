#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
using Graph = vector<vector<int>>;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
#define ALL(a)  (a).begin(),(a).end()

template <typename T>
void cout_vector(vector <T> A){
    for (T a : A) {
        for (auto aa : a){
            cout << aa << " ";
        }
        cout << endl;
    }
cout << endl;
}

template <typename T>
void cout_set(set <T> A){
    for (T a : A) {
        for (auto aa : a){
            cout << aa << " ";
        }
        cout << endl;
    }
cout << endl;
}

int main(){
    cout << "===========" << endl;
    int n;
    while (true){
        cin >> n;
        if (n == 0) break;
        vector<vector<string>> colors(n, vector<string>(6));
        rep(i, n){
            rep(j, 6){
                cin >> colors[i][j];
            }
        }
        cout << "---" << endl;
        cout << "input:" << endl;
        cout_vector(colors);
        cout << "unique:" << endl;
        set<vector<string>> unique_colors(ALL(colors));
        cout_set(unique_colors);
        cout << "result:" << endl;
        cout << (n - unique_colors.size()) << endl;
        cout << "----------" << endl;
    }



}