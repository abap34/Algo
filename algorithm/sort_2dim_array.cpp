#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
#define ALL(a)  (a).begin(),(a).end()



void output_result(vector<vector<int>> A){
    for (vector<int> arr : A){
        for (int a : arr){
            cout << a << " ";
        }
        cout << "\n";
    }
}

int main(){
    vector<vector<int>> A = {{1, 4, 5}, 
                             {6, 4, 5}, 
                             {4, 5, 5}};
    rep(i, 3){
        sort(ALL(A[i]));
    }
    output_result(A);
}