#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)

int main(){
    int a,b,c,d,e,k;
    cin >> a;
    cin >> b;
    cin >> c;
    cin >> d;
    cin >> e;
    cin >> k;
    vector<int> arr{a,b,c,d,e};
    sort(arr.begin(),arr.end());
    cout << (arr[4] - arr[0] > k ? ":(" : "Yay!") << endl; 
}