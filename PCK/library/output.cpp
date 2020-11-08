template <typename T>
void cout2darr(vector<vector<T>> A){
    for (vector<T> arr : A){
        for (T a : arr){
            cout << a << " ";
        }
        cout << endl;
    }
}