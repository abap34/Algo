def main():
    import sys
    N, T = map(int, input().split())
    S = input()
    X = list(map(int, input().split()))

    to_right_idx = [i for i in range(N) if S[i] == '1']
    to_left_idx = [i for i in range(N) if S[i] == '0']

    to_right_coords = [X[i] for i in to_right_idx]
    to_left_coords = [X[i] for i in to_left_idx]

    left_count = len(to_left_coords)
    right_count = len(to_right_coords)

    to_right_coords.sort()
    to_left_coords.sort()

    S = 0

    def count_between_left(x, y):
        # to_left_coords のうち、x以上 y以下のものの数を返す
        from bisect import bisect_left, bisect_right
        l = bisect_left(to_left_coords, x)
        r = bisect_right(to_left_coords, y)
        return r - l 

    def count_between_right(x, y):
        # to_right_coords のうち、x以上 y以下のものの数を返す 
        from bisect import bisect_left, bisect_right
        l = bisect_left(to_right_coords, x)
        r = bisect_right(to_right_coords, y)
        return r - l

    # 右に行くやつからみて、左に行くやつと何回すれ違うか考える
    for idx in to_right_idx:
        allowed_r = X[idx] + 2 * T
        c = count_between_left(X[idx], allowed_r)
        S += c

    # 左に行くやつからみて、右に行くやつと何回すれ違うか考える
    for idx in to_left_idx:
        allowed_l = X[idx] - 2 * T
        c = count_between_right(allowed_l, X[idx])
        S += c

    print(S // 2)

main()