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
   vector<int> S = {1,4,4,56,8,5,1,14};
   vector<int> T = {4,1,5,5,12,41,5,6,1};
   int on_count = 0;
   for (int s : S){             //S[k]についてonになっているスイッチを取得
            for(int t : T){
                cout << s << ":" << t << endl;
                if (s == t) on_count++;
            }
        }
    cout << on_count << endl;
    return 0;
}