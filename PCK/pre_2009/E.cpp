#define _GLIBCXX_DEBUG
#include <bits/stdc++.h>
using namespace std;
#define rep(i, n) for (int i = 0; i < (int)(n); i++)
#define ALL(a) (a).begin(), (a).end()

int get_d(vector<string> seat, int idx, int n)
// idxから最短にいる人の距離を返す
// seat:座席
// n : seat length
{
	int left_idx, right_idx;
	rep(i, n)
	{
		// 左右に1つずつ増やしていく
		left_idx = idx - i;
		right_idx = idx + i;
		if (left_idx >= 0 && seat[left_idx] != "#") // !("#") <=> 人がいる
		{
			return i;
		}

		if (right_idx < n && seat[right_idx] != "#")
		{
			return i;
		}
	}
	return 0; // warningがうざいのでつけています
}

int where(vector<string> seat, string person, int n)
// personが座る位置を返す
// seat: 座席の状態
// n: seat length
{
    if (person == "A")
    {
        rep(i, n)
        {
            if (seat[i] == "#"){  // 空席なら座る
                return i;
            }
        }
    }
    else if (person == "B")
    {
        // 右から見ていく
        for (int i = n - 1; i >= 0; i--)
        {   
            // out-of-boundsになるので場合わけ
            if (i == n - 1)
            {
                if (seat[i - 1] != "A" && seat[i] == "#"){   // 空席かつ左隣がA国人ではない
                    return i;
                }
            }
            else if (i == 0)
            {
                if (seat[i + 1] != "A" && seat[i] == "#"){   // 空席かつ右隣がA国人ではない
                    return i;
                }
            }
            else
            {
                if (seat[i - 1] != "A" && seat[i + 1] != "A" && seat[i] == "#"){  // 空席かつ左右がA国人ではない
                    return i;
                }
            }
        }
        rep(i, n)
        {
            // A国人の隣しか空いていないなら、左から見ていって空いている席に座る
            if (seat[i] == "#"){
                return i;
            }
        }
    }
    else if (person == "C")
    {
        vector<string> initial_seat(n, "#");
        // 誰も座っていない <=> 全部 "#" なら中央に座る
        if (initial_seat == seat)
        {
            return n / 2;
        }
        else
        {
            // 左から見ていく。
            for (int i = 0; i < n; i++)
            {
                if (seat[i] != "#") // 人が座っているなら
                {
                    if (i < n - 1 && seat[i + 1] == "#") // 右側に座ろうとする
                    {
                        return i + 1;
                    }
                    else if (i > 0 && seat[i - 1] == "#") // それがダメなら左側
                    {
                        return i - 1;
                    }
                }
            }
        }
    }
    else if (person == "D")
    {
        vector<string> initial_seat(n, "#");
        // 誰も座っていなければ左端に座る
        if (initial_seat == seat)
        {
            return 0;
        }
        else
        {
            // md: 最大の距離
            // max_idx: その時のidx
            int md = -1;
            int max_idx = -1;
            rep(i, n)
            {
                int d = get_d(seat, i, n);
                if (d > md)
                {
                    md = d;
                    max_idx = i;
                }
            }
            return max_idx;
        }
    }
    else
    {
        cout << "ignore" << endl;
        return 1000001;
    }
    return 0; // warningがうざいのでつけています
}

void output(vector<string> seat)
{
    for (string seet : seat)
    {
        cout << seet;
    }
    cout << endl;
}

int main()
{
    int n, m;
    string person;
    while (true)
    {
        cin >> n >> m;
        if (n == 0 && m == 0) {
            break;
        }
        vector<string> seat(n, "#");
        rep(i, m)
        {
            cin >> person;
            int idx = where(seat, person, n);
            //output(seat);
            seat[idx] = person;
        }
        output(seat);
    }
}
