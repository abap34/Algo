#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
using Graph = vector<vector<int>>;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
#define ALL(a) (a).begin(), (a).end()

int main()
{   bool flag = true;
    string R = "ABCDE";
    while (flag)
    {   
        vector<int> S(5);
        rep(j, 5){
            int s1, s2;
            cin >> s1 >> s2;
            if (s1 + s2 == 0){
                flag = false;
                break;
            }
            S[j] = s1 + s2;
        }

        if (!(flag)) break;
        int max_s = -1;
        int max_idx = 0;

        rep(i, 5)
        {
            if (max_s < S[i])
            {
                max_s = S[i];
                max_idx = i;
            }
        }
        cout << R.at(max_idx) << " " << max_s << endl;
    }
}