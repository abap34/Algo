#include <iostream>
#include <string>
#include <vector>

using namespace std;

class DefaultString {
    string s;
    int N;
    char defaultChar;

public:
    DefaultString(string str) : s(str), N(str.length()), defaultChar('-') {}

    char operator[](int i) {
        if (i < 0 || i >= N) {
            return defaultChar;
        }
        return s[i];
    }

    int size() {
        return N;
    }
};

int check_remove(DefaultString& S, int l, int r) {
    if (S[l-1] == 'A' && S[l] == 'B' && S[r] == 'C')
        return 1;

    if (S[l] == 'A' && S[r] == 'B' && S[r+1] == 'C')
        return 2;

    return 3;
}

int main() {
    string input;
    getline(cin, input);
    DefaultString S(input);
    // 削除するインデックスの集合
    std::map<int> remove_idx;

    for (int i = 0; i < S.size(); ++i) {
        if (S[i] == 'A' && S[i+1] == 'B' && S[i+2] == 'C') {
            int l = i - 1;
            int r = i + 3;
            remove_idx.push_back(i);
            remove_idx.push_back(i+1);
            remove_idx.push_back(i+2);
            while (true) {
                if (l < 0 || r >= S.size())
                    break;
                    
                int result = check_remove(S, l, r);
                if (result == 1) {
                    remove_idx.push_back(l);
                    remove_idx.push_back(l-1);
                    remove_idx.push_back(r);
                    l -= 2;
                    r += 1;
                } else if (result == 2) {
                    remove_idx.push_back(l);
                    remove_idx.push_back(r);
                    remove_idx.push_back(r+1);
                    l -= 1;
                    r += 2;
                } else {
                    break;
                }
            }
        }
    }

    string result = "";
    for (int i = 0; i < S.size(); ++i) {
        if (find(remove_idx.begin(), remove_idx.end(), i) != remove_idx.end())
            continue;
        result += S[i];
    }

    cout << result << endl;

    return 0;
}
