INF = 10 * 12

import numpy as np
import bisect


def solve(N, sx, sy, gx, gy, reacs):
    dp = [[INF for _ in range(1000)] for _ in range(1000)]

    # reacs を追加
    each_row_start = [[] for _ in range(1000)]
    each_col_start = [[] for _ in range(1000)]

    flip_v = sx >= gx
    flip_h = sy >= gy

    if flip_v:
        sx *= -1
        gx *= -1

    if flip_h:
        sy *= -1
        gy *= -1

    # 10^5
    for i, reac in enumerate(reacs):
        x, y, r = reac
        x -= sx
        y -= sy

        if flip_v:
            x = x * -1

        if flip_h:
            y = y * -1

        # 10^3
        for row in range(y - r, y + r):
            each_row_start[row].append((x - r, i))

        for col in range(x - r, x + r):
            each_col_start[col].append((y - r, i))

    # sort by start idx
    for i in range(1000):
        each_row_start[i] = sorted(each_row_start[i], key=lambda x: x[0])
        each_col_start[i] = sorted(each_col_start[i], key=lambda x: x[0])
        

    dp[0][0] = 0

    for x in range(999):
        for y in range(999):
            # 右に行く
            # y 行目に start のものが x+1 が何個あるか？
            l = bisect.bisect_left(each_row_start[y], x + 1, key=lambda x: x[0])
            r = bisect.bisect_right(each_row_start[y], x + 1, key=lambda x: x[0])
            dp[x + 1][y] = r - l


            # 下に行く
            l = bisect.bisect_left(each_col_start[x], y + 1, key=lambda x: x[0])
            r = bisect.bisect_right(each_col_start[x], y + 1, key=lambda x: x[0])
            dp[x][y + 1] = r - l

    print(dp[gx][gy])


def main():
    while True:
        N = int(input())
        if N == 0:
            return True

        sx, sy, gx, gy = list(map(int, input().split()))
        reacs = []
        for _ in range(N):
            x, y, r = list(map(int, input().split()))
            reacs.append((x, y, r))

        solve(N, sx, sy, gx, gy, reacs)



main()
