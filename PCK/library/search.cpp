#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
using Graph = vector<vector<int>>;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
#define ALL(a)  (a).begin(),(a).end()



bool binary_search(vector<int> A, int n, int key){
    int mid;
    int left = 0;
    int right = n;
    while (left < right){
        mid = (left + right) / 2;
        if (A[mid] == key){
            return true;
        } else if (A[mid] < key){
            left = mid + 1;
        } else if (A[mid] > key){
            right = mid;
        }
    }
    return false;
}

void bit_search(int N){
    for (int bit = 0; bit < (1 << N); bit++){
        vector<int> selected;
         for (int i = 0; i < N; i++){
            if (bit & (1 << i)) {
                selected.push_back(1);
            } else {
                selected.push_back(0);
            }
        }
        for (int s : selected){
            cout << s;
        }
    cout << endl;
    }
}

void search_permutation(int n){
    vector<int> pettern(n);
    rep(i, n) pettern[i] = i;

    do {
        for (int p : pettern) cout << p << " ";
        cout << endl;
    } while (next_permutation(pettern.begin(), pettern.end()))  ;
}

int main(){
    bit_search(4);
    cout << "--------------" << endl;
    search_permutation(3);
}