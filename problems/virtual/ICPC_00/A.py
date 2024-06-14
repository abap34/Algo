def solve(A, B):
    counter = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    for a in A:
        for b in B:
            S = str(a * b)
            for s in S:
                counter[int(s)] += 1

    print(*counter)


def main():
    while True:
        n, m = list(map(int, input().split()))
        if n == 0 and m == 0:
            return 0

        A = list(map(int, input().split()))
        B = list(map(int, input().split()))
        solve(A, B)


main()