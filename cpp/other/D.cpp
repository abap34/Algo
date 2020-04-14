#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)


template <typename T>
void cout_vector(vector<T> A){
    for (T a : A) cout << a << " ";
cout << endl;
}
int main(){
    int N;
    string S;
    cin >> N;
    cin >> S;
    int ans = 0;
    for (int i = 0; i < 1000; i++){
        vector<int> password_list(3);
        password_list[0] = i / 100;
        password_list[1] = i / 10 % 10;
        password_list[2] = i % 10;
        int search_idx = 0;
        for (int j = 0; j < N; j++){
            if ((password_list[search_idx] + '0') == S[j]) search_idx++;
            if (search_idx == 3) break;
        }
    if (search_idx == 3) ans++;
    }
    cout << ans << endl;
}