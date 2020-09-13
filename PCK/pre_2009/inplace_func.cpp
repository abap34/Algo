#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
using Graph = vector<vector<int>>;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
#define ALL(a)  (a).begin(),(a).end()


template <typename T>
void cout_vector(vector<T> A){
    for (T a : A) cout << a << " ";
cout << endl;
}

void f(vector<int> &A){
    for (auto &a : A){
        a *= 2;
    }
}

int main(){
    vector<int> A = {1, 2, 3};
    f(A);
    cout_vector(A);
    cout_vector(f(A));
}