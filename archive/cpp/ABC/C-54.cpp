#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)


template <typename T>
void cout_vector(vector<T> A){
    for (T a : A) cout << a +1 << " ";
    cout << endl;
}





bool in(vector<int> A, int key){
    for (int a : A){
        if (a == key) return true;
    }
    return false;
}


int main(){
    int N,M;
    cin >> N >> M;
    if (M < N - 1){
        cout << 0 << endl;
        return 0;
    }
    vector<vector<int>> Graph(N);
    rep(i,M){
        int a,b;
        cin >> a >> b;
        a--;
        b--;
        Graph[a].push_back(b);
        Graph[b].push_back(a);
    }
    vector<int> A(N - 1);
    rep(i,N - 1) A[i] = i + 1;
    int ans = 0;
    /*cout << "----------" << endl;
    for(int idx = 0; idx < N; idx++){
        cout_vector(Graph[idx]);
    }
    cout << "----------" << endl;*/
    do {
        bool flag = true;
        int start = A[0];
        if (!(in(Graph[0],start))) {      
            flag = false;
            continue;
        }
        for (int j = 1; j < N - 1; j++)  {
            int goal = A[j];        
            //cout << start << endl;    
            if (!(in(Graph[start],goal))){ 
                //cout << (start + 1) << " to " << (goal + 1) << " is not exits." << endl;
                flag = false;
                continue;
            } else {
                //cout << (start + 1) << " to " << (goal + 1) << " is exits." << endl;
            }
            start = goal;
        }
        //cout << "---" << endl;
        (flag) && (ans++);
    } while(next_permutation(A.begin(),A.end()));
    cout << ans << endl;
    return 0;
}