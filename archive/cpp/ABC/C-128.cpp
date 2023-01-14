#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)


template <typename T>
void cout_vector(vector<T> A){
    for (int i=0;i<A.size();i++){
        cout << A[i] << " ";  
    }
    cout << endl;
}







int main(){
    int N,M;
    cin >> N >> M;
    vector<vector<int>> S(M);
    vector<int> P(M);
    vector<int> K(M);
    int ans = 0;
    rep(i,M){
        int k;
        cin >> k;
        vector<int> s(k);
        rep(j,k) cin >> s[j];
        S[i] = s;
    }
    rep(i,M) cin >> P[i];
    for (int bit = 0 ; bit < (1 << N); bit++){
        bool flag = true;
        vector<int> True_switch;
        for (int i = 0; i < N; i++){
            if(bit & (1 << i)){
                True_switch.push_back(i+1);
            }
        }   
    //cout << "----------" << endl;
    //cout_vector(True_switch);
    int m = 0;
    rep(k,M){
        int on_count = 0;
        for (int s : S[k]){             
            for(int t : True_switch){
                if (s == t) on_count++;
            }
        }
        flag =  (on_count % 2 == P[k]);
        if (!(flag)) break;            
        m++;
    }
    (m == M) && (ans++);
    }
    cout << ans << endl;
    return 0;
}
