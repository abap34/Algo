#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)


class Range {
    public:
        int start;
        int step;
        int length;
    int at(int i){
        return start + step * (i);
    }
};

int sum(Range A){
    return (2 * A.start + (A.length - 1) * A.step) * A.length / 2;
}

int main(){
    int N,L,min_apple;
    Range arr;
    cin >> N >> L;
    if ((L + N) <= 0) min_apple = L + N - 1;
    else if (L >= 0) min_apple = L;
    else min_apple = 0;
    cout << (sum(Range{L,1,N}) - min_apple) << endl;
    return 0;
}