def field_to_graph(field, H, W):
    # B が False なら上下左右に辺が張られてるとみなす
    G = {}

    for i in range(1, H+1):
        for j in range(1, W+1):
            # 上下左右を見て、B[i, j]がFalseなら辺を張る
            G[(i, j)] = set()

            # 自分が壁なら何もしない
            if field[i-1][j-1]:
                continue

            if i > 1 and not field[i-2][j-1]:
                G[(i, j)].add((i - 1, j))

            if i < H and not field[i][j-1]:
                G[(i, j)].add((i + 1, j))

            if j > 1 and not field[i-1][j-2]:
                G[(i, j)].add((i, j - 1))

            if j < W and not field[i-1][j]:
                G[(i, j)].add((i, j + 1))

    return G


def main():
    H, W = map(int, input().split())
    A = [['a'] * W for _ in range(H)]

    for i in range(H):
        A[i] = list(input())

    B = [[False] * W for _ in range(H)]

    # 上下左右が '#' かどうか
    for i in range(H):
        for j in range(W):
            if A[i][j] == '#':
                B[i][j] = True
            else:
                if i > 0 and A[i-1][j] == '#':
                    B[i][j] = True
                elif i < H-1 and A[i+1][j] == '#':
                    B[i][j] = True
                elif j > 0 and A[i][j-1] == '#':
                    B[i][j] = True
                elif j < W-1 and A[i][j+1] == '#':
                    B[i][j] = True

    G = field_to_graph(B, H, W)

    groups = []

    visited = [[False] * W for _ in range(H)]
    stack = []

    def dfs(i, j, group):
        stack.append((i, j))

        while stack:
            i, j = stack.pop()

            if visited[i-1][j-1]:
                continue

            visited[i-1][j-1] = True
            group.append((i, j))

            for ni, nj in G[(i, j)]:
                stack.append((ni, nj))

    for i in range(1, H+1):
        for j in range(1, W+1):
            if visited[i-1][j-1]:
                continue

            group = []
            dfs(i, j, group)
            groups.append(group)

    max_size = -1

    for group in groups:
        group_set = set(group)
        for i, j in group:
            if B[i-1][j-1]:
                continue

            if i > 1 and B[i-2][j-1]:
                group_set.add((i - 1, j))

            if i < H and B[i][j-1]:
                group_set.add((i + 1, j))

            if j > 1 and B[i-1][j-2]:
                group_set.add((i, j - 1))

            if j < W and B[i-1][j]:
                group_set.add((i, j + 1))

        max_size = max(max_size, len(group_set))

    print(max_size)


if __name__ == "__main__":
    main()
