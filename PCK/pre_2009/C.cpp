#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
using Graph = vector<vector<int>>;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
#define ALL(a)  (a).begin(),(a).end()


int main(){
    int a, b, step, r;
    while (true)
    {   
        cin >> a >> b;
        if ((a == 0) and (b == 0)) break;
        if (a < b){
            int  tmp = a;
            a = b;
            b = tmp;
        }

        step = 1;
        r = a % b;
        while (r != 0){
            a = b;
            b = r;
            r = a % b;
            step++;
        }
        cout << b << " " << step << endl;
    }
    
}