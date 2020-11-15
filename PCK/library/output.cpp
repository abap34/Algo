template <typename T>
void cout2darr(vector<vector<T>> A){
    for (vector<T> arr : A){
        for (T a : arr){
            cout << a << " ";
        }
        cout << endl;
    }
}


template <typename T, T2>
void coutmap(map<T, T2> M){
    for (auto p : M){
        cout << p.first << " => " << p.second;
    }
}


