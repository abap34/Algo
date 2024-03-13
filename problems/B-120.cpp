#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)


template <typename T>
void array_printer(vector<T> A){
    rep(i,A.size()) cout << A[i] << " ";
    cout << endl;   
}
int main(){
    int A,B,K;
    cin >> A >> B >> K;
    vector<int> ans;
    for (int i = max(A,B); i > 0; i--){
        if ( A % i == 0 && B % i == 0 ){
            ans.push_back(i);
        }
    }
    //array_printer(ans);
    cout << ans[K-1] << endl;
    return 0;
}