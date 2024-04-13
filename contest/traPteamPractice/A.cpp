#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
using Graph = vector<vector<int>>;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
#define ALL(a)  (a).begin(),(a).end()

int main() {
    int N;
    cin >> N;
    vector<int> A(N);

    rep(i, N) cin >> A.at(i);

    for (int i = 0; i < N; i++) {
        for (int j = i+1; j < N; j++) {
            int d = A.at(j) - A.at(i);
            if (d % (N - 1) == 0) {
                cout << A.at(i) << " " << A.at(j) << endl;
                return 0;
            }
        }
    }

    return 0;
}