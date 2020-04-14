#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)


bool in(vector<int> A, int key){
    for (int a : A){
        if (a == key) return true;
    }
    return false;
}
 

bool isInclusion(vector<int> A,vector<int> B){  // AはBの部分集合か？
    if (A.size() > B.size()) return false; 
    for (int a : A) if (!(in(B,a))) return false;
    return true;
}


int main(){
    int N,M;
    cin >> N >> M;
    vector<vector<int>> Graph(N);
    rep(j,N){
        Graph[j].push_back(j);  // 自分自身は知り合い
    }
    rep(i,M){
        int x,y;
        cin >> x >> y;
        x--;                    // 0-based index に変換する
        y--;
        Graph[x].push_back(y);  // 互いに知り合い
        Graph[y].push_back(x);
    }
    int max_ans = 0;
    for (int bit = 0; bit < (1 << N); bit++){
        bool flag = true;
        vector<int> people;
        for (int i = 0; i < N; i++){
            if (bit & (1 << i)){
                people.push_back(i);
            }
        }
        for (int person : people) if (!(isInclusion(people,Graph[person]))){
            flag = false;
            continue;
        } 
        if (flag && (people.size() > max_ans)) max_ans = people.size();
    }
    cout << max_ans << endl;
}