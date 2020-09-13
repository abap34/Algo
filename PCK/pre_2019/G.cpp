#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
using Graph = vector<vector<int>>;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
#define ALL(a)  (a).begin(),(a).end()

bool is_in(vector<int> A, int key){
    return find(A.begin(), A.end(), key) != A.end();
}

vector<int> divisor(int n){
    vector<int> ans;
    for (int i = 2; i < sqrt(n); i++){
        if (n % i == 0) {
            ans.push_back(i);
            ans.push_back(n / i);
        }
    }
    return ans;
}

int lcm(vector<int> arr){
    int n = arr.size();
    int ans;
    rep(i, n - 1){
        
    }
}

void output(vector<vector<int>> A){
    for (vector<int> a : A){
        for (int aa : a){
            cout << aa << " ";
        }
        cout << endl;
    }
}

template <typename T>
void cout_vector(vector<T> A){
    for (T a : A) cout << a << " ";
cout << endl;
}

int main(){
    int N;
    int ans = 0;
    cin >> N;
    vector<int> P(N);
    rep(i, N) cin >> P[i];
    vector<vector<int>> must_same(N);
    rep(i, N){
        int p = P[i];
        vector<int> digs;
        digs = divisor(p);
        for (int d : digs){
            rep(j, N){
                int pp = P[j];
                if (d == pp) must_same[i].push_back(j);
            }
        }
    }

    //output(must_same);

    for (int bit = 1; bit < (1 << N); bit++){
        vector<int> selected;
        for (int i = 0; i < N; i++){
            if (bit & (1 << i)) {
                selected.push_back(i);
            }
        }
        
        cout << "search:" << endl;
        cout_vector(selected);
        bool flag = true;
        for (int sel : selected){
            for (int same : must_same[sel]){
                if (!(is_in(selected, same))){
                    cout << P[same] << " is in. but " << same << " is not in." << endl;;
                    flag = false;
                    break;
                }
            }
        }
        if (flag) {
            cout << "It's ok" << endl;
            ans += 1;
        }
        cout << "-----" << endl;
    }
    cout << ans << endl;
}