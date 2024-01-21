#include <iostream>
#include <string>
#include <vector>

using namespace std;

bool skip_diff(string s, string t){
    int S_idx = 0;
    int T_idx = 0;
    bool use_skip  = false;
    int N_T = t.size();
    while (true) {
        if (s.at(S_idx) != t.at(T_idx)) {
            if (use_skip) {
                return false;
            }
            use_skip = true;
            S_idx++;
        }
        else {
            if (T_idx == N_T - 1) {
                return true;
            }
            S_idx++;
            T_idx++;
        }
    }
}


int ndiff(string s, string t){
    int n_diff = 0;
    for (int i = 0; i < s.size(); i++)
    {
        if (s.at(i) != t.at(i)) {
            n_diff++;
        }
    }
    return n_diff;
}


int main(){
    std::cin.tie(0)->sync_with_stdio(0);
    int N;
    string T;
    cin >> N >> T;

    int K = 0;
    vector<int> ans;

    for (int i = 0; i < N; i++)
    {
        string S;
        cin >> S;
        if (S.size() == T.size()) {
            if (ndiff(S, T) <= 1) {
                K++;
                ans.push_back(i);
            }
        }
        else if (S.size() == T.size() + 1) {
            if (skip_diff(S, T)) {
                K++;
                ans.push_back(i);
            }
        }
        else if (S.size() == T.size() - 1) {
            if (skip_diff(T, S)) {
                K++;
                ans.push_back(i);
            }
        }
    }

    cout << K << endl;
    for (int i = 0; i < ans.size(); i++)
    {
        cout << ans.at(i) + 1 << " ";
    }

    std::cout << std::endl;

    return 0;
}
