#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
using Graph = vector<vector<int>>;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
#define ALL(a)  (a).begin(),(a).end()


template <typename T>
void cout_vector(vector<T> A){
    for (T a : A) cout << a << " ";
cout << endl;
}

int main(){
    int N, M, K;
    cin >> N >> M >> K;
    vector<int> A(N);
    vector<int> B(M);
    rep(i, N) cin >> A[i];
    rep(j, M) cin >> B[j];
    vector<int> C;
    vector<int> D;
    C.push_back(0);
    D.push_back(0);

    for (int i = 1; i <= N; i++){
        if (C[i - 1] + A[i - 1] > K) break;
        C.push_back(C[i - 1] + A[i - 1]);
    }

    for (int j = 1; j <= M; j++){
        if (D[j - 1] + B[j - 1] > K) break;
        D.push_back(D[j - 1] + B[j - 1]);
    }


    int max_ans = -1;
    for (int i = 0; i < C.size() ; i++){
        int d = K - C[i];
        int left = -1;
        int right = D.size();
        while (abs(right - left) > 1){
            int mid = (left + right) / 2;
            if (D[mid] > d) right = mid;
            else left = mid;
        }
        int ans = i + left;
        max_ans = max(max_ans, ans);
    }
    cout << max_ans << endl;
}