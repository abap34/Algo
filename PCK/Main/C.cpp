#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
using Graph = vector<vector<int>>;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
#define ALL(a)  (a).begin(),(a).end()


template <typename T>
void cout2darr(vector<vector<T>> A){
    for (vector<T> arr : A){
        for (T a : arr){
            cout << a << " ";
        }
        cout << endl;
    }
}



int main(){
    int x1, y1, w1, h1, x2, y2, w2, h2;
    cin >> x1 >> y1 >> w1 >> h1;
    cin >> x2 >> y2 >> w2 >> h2;

    vector<vector<int>> field(2000, vector<int>(2000));

    for (int x = x1; x < x1 + w1; x++)
    {
        for (int y = y1; y < y1 + h1; y++)
        {
            field[x][y] += 1;
        }
        
    }
    

    for (int x = x2; x < x2 + w2; x++)
    {
        for (int y = y2; y < y2 + h2; y++)
        {
            field[x][y] += 1;
        }
        
    }


    int ans = 0;

    
    


    rep(i, 2000){
        rep(j, 2000){
           if (field[i][j] == 1) ans += 1;
        }
    }

    cout << ans << endl;

}