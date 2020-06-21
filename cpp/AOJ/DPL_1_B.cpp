#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
using Graph = vector<vector<int>>;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
#define ALL(a)  (a).begin(),(a).end()



int main(){
    int N, W;
    cin >> N >> W;
    vector<int> value(N);
    vector<int> weight(N);
    rep(i, N) cin >> value[i] >> weight[i];
    vector<vector<int>> dp(101, vector<int>(10001));
    //dp[i][j] := i番目までの中から重みがw以下で選んだ時の価値の総和の最大値
    for (int w = 0; w <= W; ++w) dp[0][w] = 0; 
    //何も選ばなければ当然0

    rep(i, N){
        rep(w, W + 1){
            if (w >= weight[i]){
                dp[i + 1][w] = max(dp[i][w - weight[i]] + value[i], dp[i][w]);
            } else {
                dp[i + 1][w] = dp[i][w];
            }
        }
    }
    cout << dp[N][W] << endl;
}