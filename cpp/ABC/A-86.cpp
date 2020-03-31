#include <bits/stdc++.h>
using namespace std;
#define _GLIBCXX_DEBUG

int isOdd(int n){
    return n % 2;
}


int main(){
    int a,b;
    cin >> a >> b;
    cout << (isOdd(a*b) ? "Odd" : "Even" ) << endl; 
}