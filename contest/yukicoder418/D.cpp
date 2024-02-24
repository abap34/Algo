#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
using Graph = vector<vector<int>>;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
#define ALL(a) (a).begin(), (a).end()

int searchsortedfirst(const std::vector<int> &vec, int value)
{
    int low = 0;
    int high = vec.size() - 1;
    int pos = 0;

    while (low <= high)
    {
        int mid = low + (high - low) / 2;

        if (vec[mid] == value)
        {
            return mid;
        }
        else if (vec[mid] < value)
        {
            pos = mid + 1;
            low = mid + 1;
        }
        else
        {
            pos = mid;
            high = mid - 1;
        }
    }

    return pos;
}


int main()
{
    int N, A, T;
    cin >> N >> A;

    vector<int> X(N);

    rep(i, N) cin >> X[i];

    sort(ALL(X));

    cin >> T;

    vector<vector<int>> pusht(T + 1);
    vector<vector<int>> popt(T + 1);

    vector<int> L(T);
    vector<int> R(T);

    rep(i, N) cin >> L[i] >> R[i];


    rep(t, T)
    {
        int l = L[t];
        int r = R[t];

        int lpos = searchsortedfirst(X, l);
        int rpos = searchsortedfirst(X, r);

        pusht[lpos].push_back(t + 1);
        popt[rpos].push_back(t + 1);
    }

    set<int> current;

    rep(i, N)
    {
        for (auto t : popt[i])
        {
            if (current.count(t))
            {
                current.erase(t);
            }
        }

        for (auto t : pusht[i])
        {
            current.insert(t);
        }

        if (current.size() > 0)
        {
            cout << *current.rbegin() << endl;
        }
        else
        {
            cout << -1 << endl;
        }
    }
}
