#include <bits/stdc++.h>
using namespace std;
#define _GLIBCXX_DEBUG

int main(){
    int N;
    string S;
    for (int i = 0; i < N; i++)
    {   
        string begin_str,fin_str;
        begin_str = S.substr(1,i);
        fin_str = S.substr(i+1,N);
        auto set_begin_str = unique(begin_str.begin(),begin_str.end());
        auto set_fin_str = unique(fin_str.begin(),fin_str.end());
        cout << set_begin_str << endl;
        cout << set_fin_str << endl;
   }
    
}