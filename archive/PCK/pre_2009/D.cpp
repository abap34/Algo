#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
using Graph = vector<vector<int>>;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
#define ALL(a) (a).begin(), (a).end()


void turn_side(vector<string> &box)
{
    string tmp;
    tmp = box[3];
    box[3] = box[5];
    box[5] = box[2];
    box[2] = box[0];
    box[0] = tmp;
}

void turn_vertical(vector<string> &box)
{
    string tmp;
    tmp = box[0];
    box[0] = box[4];
    box[4] = box[5];
    box[5] = box[1];
    box[1] = tmp;
}

int main()
{
    int n;
    while (true)
    {
        cin >> n;
        if (n == 0)
            break;
        vector<vector<string>> boxes(n, vector<string>(6));

        rep(i, n)
        {
            rep(j, 6)
            {
                cin >> boxes[i][j];
            }
        }

        int duplicate_count = 0;

        rep(i, n)
        {
            set<pair<int, int>> seen_pair;
            vector<string> box = boxes[i];
            rep(t, 4)
            {
                rep(y, 4)
                {
                    rep(_, y) turn_side(box);
                    rep(_, t) turn_vertical(box);
                    rep(j, n)
                    {
                        if (i != j && box == boxes[j])
                        {
                            pair<int, int> same_pair = make_pair(i, j);
                            if (seen_pair.find(same_pair) == seen_pair.end())
                            {
                                seen_pair.insert(same_pair);
                                duplicate_count += 1;
                            }
                        }
                    }
                }
            }
        }

        cout << duplicate_count / 2 << endl;
    }
}