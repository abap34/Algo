#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)

struct pair_3
{
    string val1;
    int val2;
    int val3;
};

 
bool operator<(const pair_3& left, const pair_3& right) {
    if (left.val1 != right.val1){
        return left.val1 < right.val1;
    } else {
        if (left.val2 != right.val2){
            return left.val2 < right.val2;
        } else {
            return left.val3 < right.val3;
        }
    }
}


int main(){
    int N;
    cin >> N;
    vector<pair_3> restaurants(N);
    rep(i,N){
        string s;
        int p;
        cin >> s >> p;
        restaurants[i] = {s,-p,i+1};
    }
    sort(restaurants.begin(),restaurants.end());
    for (pair_3 restaurant : restaurants){
        cout << restaurant.val3 << endl;;
    }
    return 0;
}