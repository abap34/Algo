#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
const long long INF = 1LL << 60;
const int MOD = 1000000007;



template <typename T>
void cout_vector(vector<T> A){
    for (T a : A) cout << a << " ";
    cout << endl;
}

int main(){
    int N;
    cin >> N;
    bool flag = true;
    vector<vector<int>> X(15,vector<int>(15));
    vector<vector<int>> Y(15,vector<int>(15));
    vector<int> A(N);
    rep(i,N){
        cin >> A[i];
        X[i].resize(A[i]);
        Y[i].resize(A[i]);
        rep(j,A[i]){
            int x,y;
            cin >> x >> y;
            X[i][j] = x - 1 ; //0-based indexにする
            Y[i][j] = y ;
        }
    }
    int max_honest = -1;
    for(int bit = 0; bit < (1 << N); bit++){
        flag = true;
        //cout << "search[" << bitset<3> (bit) << "]pettern..." << endl;
        int honest_count = 0;
        for(int i = 0; i < N; i++){
            if (!(flag)) break;
            if (bit & (1 << i)){
                honest_count++;
                for (int j = 0; j < A[i]; j++){
                    int y = Y[i][j];
                    int x = X[i][j];
                    int w = (bit & (1 << x)) != 0;
                    //cout << i << " says " << x << " is " << y << " " << "true:" << w << endl;;
                    if (w != y) {
                        flag = false;
                        honest_count = -1;
                        break;
                    }
                }
            }
        }
        //cout << "honest count:" << honest_count << endl;
        //cout << "=====" << endl;

        max_honest = max(max_honest,honest_count);
    }
    cout << max_honest << endl;

}