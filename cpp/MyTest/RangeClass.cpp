#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)

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

int main(){
    int N;
    Range arr;
    cin >> N;
    arr = Range{2,4,N};
    rep(i,N) cout << arr[i] << endl;
    return 0;
}
