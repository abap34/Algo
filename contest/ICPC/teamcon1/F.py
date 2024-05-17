import sys

sys.setrecursionlimit(10**8)

DEBUG = False

def debug(*args):
    if DEBUG:
        debug(*args)

def make_table(W, H, w_rhythm, h_rhythm, rhythm_idx):
    g = {}
    for i in range(W):
        for j in range(H):
            g[(j, i)] = []

    debug(g.keys())


    for i in range(W - 1):
        for j in range(H):
            w_open = w_rhythm[i][j] == rhythm_idx
            if w_open:
                debug(f"w_rhythm{i,j} is open when {rhythm_idx}. connect {(i, j)} to {(i, j+1)}")
                g[(i, j)].append((i, j+1))
                g[(i, j+1)].append((i, j))

    for i in range(W):
        for j in range(H - 1):
            h_open = h_rhythm[i][j] == rhythm_idx
            if h_open:
                debug(f"h_rhythm{i,j} is open when {rhythm_idx}. connect {(j, i)} to {(j+1, i)}")
                g[(j, i)].append((j+1, i))
                g[(j+1, i)].append((j, i))

    return g


def solve(H, W, w_rhythm, h_rhythm):
    table_1 = make_table(W, H, w_rhythm, h_rhythm, 1)
    debug("=====================================")
    # debug(table_1)
    table_2 = make_table(W, H, w_rhythm, h_rhythm, 2)
    debug("=====================================")
    # debug(table_2)
    table_3 = make_table(W, H, w_rhythm, h_rhythm, 3)
    # debug(table_3)

    r_to_table = {1: table_1, 2: table_2, 3: table_3}

    # table_0 からスタートで bfs して最短距離出す
    pos = (0, 0)
    goal = (H-1, W-1)
    visited = set()

    next_r = {1: 2, 2: 3, 3: 1}

    def bfs(pos, r, d):

        debug("in", pos, "with r", r, "and d", d)
        next_poss = r_to_table[r][pos]
        debug("next:", next_poss)

        _d = []

        for next_pos in next_poss:
            if next_pos == goal:
                debug("it's goal!")
                return d

            if next_pos in visited:
                continue

            visited.add(next_pos)

            _d.append(bfs(next_pos, next_r[r], d + 1))

        if not _d:
            return 10**9
        else:
            return min(_d)

    d_1 = bfs(pos, 1, 0)
    debug("===============")
    d_2 = bfs(pos, 2, 0)
    debug("===============")
    d_3 = bfs(pos, 3, 0)

    ans = min(d_1, d_2, d_3) + 1
    if ans >= 10**9:
        print(-1)

    else:
        print(ans)


def main():
    H, W = map(int, input().split())
    w_rhythms = []
    for _ in range(H):
        w_rhythm = list(map(int, input().split()))
        w_rhythms.append(w_rhythm)

    h_rhythms = []
    for _ in range(W):
        h_rhythm = list(map(int, input().split()))
        h_rhythms.append(h_rhythm)

    solve(H, W, w_rhythms, h_rhythms)


if __name__ == "__main__":
    main()
