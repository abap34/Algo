#include <bits/stdc++.h>
using namespace std;
#define _GLIBCXX_DEBUG



int main(){
    int A,B;
    vector <int> vec(3);
    cin >> A >> B;
    vec[0] = A + B;
    vec[1] = A - B;
    vec[2] = A * B;
    cout << *max_element(vec.begin(),vec.end()) << endl;
    return 0;
}
