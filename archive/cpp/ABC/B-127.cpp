#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
int sum(vector<int> A,int N){
    int res = 0;
    rep(i,N) res += A[i];
    return res;
}
class Range {
    public:
        int start;
        int step;
        int length;
        int operator[](int i){
            return start + step * i;
}
};
int sum(Range A){
    return (2 * A.start + (A.length - 1) * A.step) * A.length / 2;
}
template <typename T>
vector<T> slice_vector(vector<T> A,int start_idx,int fin_idx){
    vector<T> res(fin_idx - start_idx);
    for (int i = start_idx; i < fin_idx; i++)
    {
        res[i-start_idx] = A[i];
    }
    return res;
}
template <typename T>
void cout_vector(vector<T> A){
    for (int i=0;i<A.size();i++){
        cout << A[i] << " ";  
    }
    cout << endl;
}
int main(){
    int r,D,x,ans;
    cin >> r >> D >> x;
    rep(i,10){
        x =  r * x - D;
        cout << x << endl;
    }
}