#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
int main(){
  int A,B;
  cin>>A>>B;
  if((1<=A<=9)&&(1<=B<=9)){
    cout<<A*B<<endl;
  }
  else{
    cout<<"-1"<<endl;
  }
}
