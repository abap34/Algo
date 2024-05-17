def solve(N, A):
    return N % (A + 1)

def main():
    N, A = map(int, input().split())
    print(solve(N, A))


if __name__ == "__main__":
    main()