#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
using Graph = vector<vector<int>>;
#define rep(i, n) for (int i = 0; i < (int)(n); i++);
#define ALL(a)  (a).begin(),(a).end();
#define _debug(a) cout << #a << ": " << a << endl;


struct UnionFind {
    vector<int> par, siz;

    // par[x] = x <=> xは根
    UnionFind(int n): par(n), siz(n) {
        for (int i = 0; i < n; i++) par[i] = i; 
    }

    //　xが属する根を求める
    int root(int x) {
        if (par[x] == x) return x;
        // 経路圧縮
        else return par[x] = root(par[x]); 
    }

    // xとyが同じ根付き木に属するかどうか(根が一致するのかどうか)
    bool issame(int x, int y){
        return root(x) == root(y);
    }

    // xを含むグループとyを含むグループを併合(既に併合済みならFalseを返す)
    bool unite(int x, int y){
        x = root(x);
        y = root(y);
        // 根まで移動

        if (x == y) return false;

        // union by size
        if (siz[x] < siz[y]) swap(x, y);

        // yをxの子にする
        par[y] = x;
        siz[x] += siz[y];
        return true;
    }

    // xを含むグループのサイズを返す
    int size(int x){
        return siz[root(x)];
    }

    void debug(){
        map<int, vector<int>> trees;

        for (int i = 0; i < par.size(); i++) {
            if (par[i] == i){
                trees[i] = vector<int>();
            }
        }
        
        for (int i = 0; i < par.size(); i++){
            if (par[i] != i){
                for (auto p : trees){
                    int _root = p.first;
                    if (issame(p.first, i)) {
                        trees[p.first].push_back(i);
                        break;
                    }
                }
            }
        }

        for (auto p : trees){
            cout << p.first << " => [";
            for (int v : p.second){
                cout << v << ", ";
            }
            cout << "]" << endl;
        }
    }
};



int main(){
    UnionFind uf(7);
    //uf.debug();
    //cout << "--------------" << endl;
    uf.unite(1, 2);
    //uf.debug();
    //cout << "--------------" << endl;
    uf.unite(2, 3);
    //uf.debug();
    uf.unite(5, 6);
    //cout << "-------------" << endl;
    uf.debug();
    //cout << "======" << endl;
}