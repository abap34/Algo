#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
using Graph = vector<vector<int>>;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
#define ALL(a) (a).begin(), (a).end()

typedef struct Point
{
    long long x, y;
} point;

bool same(point &a, point &b)
{
    return a.x == b.x && a.y == b.y;
}

bool solve(point &a, point &b, point &c, point &d)
{
    if (same(b, d))
    {
        return true;
    }

    if (same(a, c))
    {
        return false;
    }
    long long s, t;
    s = (a.x - b.x) * (c.y - a.y) - (a.y - b.y) * (c.x - a.x);
    t = (a.x - b.x) * (d.y - a.y) - (a.y - b.y) * (d.x - a.x);
    if (s * t > 0)
        return true;

    s = (c.x - d.x) * (a.y - c.y) - (c.y - d.y) * (a.x - c.x);
    t = (c.x - d.x) * (b.y - c.y) - (c.y - d.y) * (b.x - c.x);
    if (s * t > 0)
        return true;

    return false;
}

int main()
{
    int T;
    cin >> T;

    rep(i, T)
    {
        point a, b, c, d;
        cin >> a.x >> a.y >> b.x >> b.y >> c.x >> c.y >> d.x >> d.y;
        if (solve(a, c, b, d))
            cout << "Yes" << endl;
        else
            cout << "No" << endl;
    }
}