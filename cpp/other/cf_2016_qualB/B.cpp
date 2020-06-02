#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
using BigInt = long long;
#define ALL(a)  (a).begin(),(a).end()

int main(){
    int N, A, B;
    cin >> N >> A >> B;
    string S;
    cin >> S;
    int ok_count = 0;
    int ok_count_fore = 0;
    for (char s : S){
        if (s == 'a'){

            if (ok_count < A + B){
                cout << "Yes" << endl;
                ok_count ++;
            } else {
                cout << "No" << endl;
            }

        } else if(s == 'b'){

            if ((ok_count < A + B) && (ok_count_fore < B)) {
                cout << "Yes" << endl; 
                ok_count ++;
                ok_count_fore ++;
            } else {
                cout << "No" << endl;
            }

        } else {
            cout << "No" << endl;
        }
    }
}