/*
validation
*/

#include<bits/stdc++.h>
#include "testlib.h"
using namespace std;

using ll = long long;

const ll Nmin = 1, Nmax = 2000;
const ll Hmin = 1, Hmax = 500;
const ll Xmin = 1, Xmax = 500;
const ll Ymin = 1, Ymax = 500;


int main(){
    registerValidation();
    ll N = inf.readLong(Nmin, Nmax);
    inf.readEoln();
    ll H = inf.readLong(Hmin, Hmax);
    inf.readEoln();
    for(ll i = 0; i < N; i++){
        ll x = inf.readLong(Xmin, Xmax);
        inf.readSpace();
        ll y = inf.readLong(Ymin, Ymax);
        inf.readEoln();
    }
    inf.readEof();
    return 0;
}