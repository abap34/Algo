#include<bits/stdc++.h>
#include<atcoder/all>
#define rep(i,n) for (int i = 0; i < int(n); ++i)
#define repp(i,n,m) for (int i = m; i < int(n); ++i)
#define reb(i,n) for (int i = int(n)-1; i >= 0; --i)
#define all(v) v.begin(),v.end()
using namespace std;
using namespace atcoder;
using ll = long long;
using ull = unsigned long long;
using ld = long double;
using P = pair<int, int>;
using PL = pair<long long, long long>;
using pdd = pair<long double, long double>;
using pil = pair<int,ll>;
using pli = pair<ll,int>;
template<class T>istream &operator>>(istream &is,vector<T> &v){for(auto &e:v)is>>e;return is;}
template<typename T>bool range(T a,T b,T x){return (a<=x&&x<b);}
template<typename T>bool rrange(T a,T b,T c,T d,T x,T y){return (range(a,c,x)&&range(b,d,y));}
template<typename T>void rev(vector<T> &v){reverse(v.begin(),v.end());}
void revs(string &s) {reverse(s.begin(),s.end());}
template<typename T>void sor(vector<T> &v, int f=0){sort(v.begin(),v.end());if(f!=0) rev(v);}
template<typename T>bool chmin(T &a,const T &b){if(a>b){a=b;return true;}return false;}
template<typename T>bool chmax(T &a,const T &b){if(a<b){a=b;return true;}return false;}
template<typename T>void uniq(vector<T> &v){sor(v);v.erase(unique(v.begin(),v.end()),v.end());}
template<typename T1, typename T2>void print(pair<T1,T2> a);
template<typename T>void print(vector<T> v);
template<typename T>void print(vector<vector<T>> v);
void print(){ putchar(' '); }
void print(bool a){ printf("%d", a); }
void print(int a){ printf("%d", a); }
void print(long a){ printf("%ld", a); }
void print(long long a){ printf("%lld", a); }
void print(char a){ printf("%c", a); }
void print(char a[]){ printf("%s", a); }
void print(const char a[]){ printf("%s", a); }
void print(long double a){ printf("%.15Lf", a); }
void print(const string& a){ for(auto&& i : a) print(i); }
void print(unsigned int a){ printf("%u", a); }
void print(unsigned long long a) { printf("%llu", a); }
template<class T> void print(const T& a){ cout << a; }
int out(){ putchar('\n'); return 0; }
template<class T> int out(const T& t){ print(t); putchar('\n'); return 0; }
template<class Head, class... Tail> int out(const Head& head, const Tail&... tail){ print(head); putchar(' '); out(tail...); return 0; }
template<typename T1,typename T2>void print(pair<T1,T2> a){print(a.first);print(),print(a.second);}
template<typename T>void print(vector<T> v){for(auto ite=v.begin();ite!=v.end();){print(*ite);if(++ite!=v.end())print();}}
template<typename T>void print(vector<vector<T>> v){for(auto ite=v.begin();ite!=v.end();){print(*ite);if(++ite!=v.end())out();}}
void yes(){out("Yes");}
void no (){out("No");}
void yn (bool t){if(t)yes();else no();}
void fast_io(){cin.tie(0); ios::sync_with_stdio(0); cout<<fixed<<setprecision(20);}
void o(){out("!?");}

namespace noya2{

const int INF = 1001001007;
const long long mod1 = 998244353;
const long long mod2 = 1000000007;
const long long inf = 2e18;
const long double pi = 3.14159265358979323;
const long double eps = 1e-7;
const vector<int> dx = {0,1,0,-1,1,1,-1,-1};
const vector<int> dy = {1,0,-1,0,1,-1,-1,1};
const string ALP = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
const string alp = "abcdefghijklmnopqrstuvwxyz";
const string NUM = "0123456789";

} // namespace noya2
using namespace noya2;

//using mint = modint998244353;
//using mint = modint1000000007;
using mint = modint;
void out(mint a){out(a.val());}
void out(vector<mint> a){vector<ll> b(a.size()); rep(i,a.size()) b[i] = a[i].val(); out(b);}
void out(vector<vector<mint>> a){for (auto v : a) out(v);}
istream &operator>>(istream &is,vector<mint> &v){for(auto &e:v){ll _x;is>>_x;e=_x;}return is;}

ll op(ll a, ll b){ return a + b; }
ll e(){ return 0LL; }

void solve(){
    int n; cin >> n;
    vector<int> a(n); cin >> a;
    vector<int> b(n);
    rep(i,n) b[--a[i]] = i;
    segtree<ll,op,e> seg(n);
    ll ans = 0;
    reb(i,n){
        ans += min(seg.prod(0,b[i]),seg.prod(b[i]+1,n));
        seg.set(b[i],1);
    }
    out(ans);
}

int main(){
    fast_io();
    int t = 1; //cin >> t;
    while(t--) solve();
}