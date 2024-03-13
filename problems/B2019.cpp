#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
using Graph = vector<vector<int>>;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
#define ALL(a)  (a).begin(),(a).end()


int where(vector<queue<int>>& lane, int N){
    int min_value = 1000000;
    int min_idx = -1;
    rep(i, N){
        if (lane[i].size() < min_value) {
            min_value = lane[i].size();
            min_idx = i;
        }
    }
    return min_idx;
}



int main(){
    int N, M;
    cin >> N >> M;
    vector<queue<int>> lane(N);
    rep(i, M){
        int info, idx;
        cin >> info >> idx;
        if (info == 1){
            int car_idx = where(lane, N);
            lane[car_idx].push(idx);
        } else {
            cout << lane[idx - 1].front() << endl;
            lane[idx - 1].pop();
        }
    }
}