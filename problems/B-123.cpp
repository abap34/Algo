#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
int sum(vector<int> A){
    int res = 0;
    for (int a : A) res += a;
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
template <typename T>
int minimum(vector<T> A){
    int m = 10^100;
    for (T a : A){
     if (a < m) m = a;
    }
    return m;
}

template <typename T>
int maximum(vector<T> A){
    int m = 10^-100;
    for (T a : A) {
        if (a > m) m = a;
    }
    return m;
}


int main(){
    int A,B,C,D,E,as,bs,cs,ds,es;
    vector<int> Times(5);
    vector<int> remTimes(5);
    cin >> A;
    cin >> B;
    cin >> C;
    cin >> D;
    cin >> E;
    as = 10 - A % 10;
    bs = 10 - B % 10;
    cs = 10 - C % 10;
    ds = 10 - D % 10;
    es = 10 - E % 10;
    remTimes = {as,bs,cs,ds,es};
    Times = {A,B,C,D,E};
    rep(i,5) (remTimes[i] != 10) ? (Times[i] += remTimes[i]) : (remTimes[i] = 0);
    int ans = sum(Times) - maximum(remTimes);
    cout << ans << endl;
}