def solve(b):
    print(b)
    while b > 1:
        b //= 2
        print(b)

def main():
    b = int(input())
    solve(b)


if __name__ == "__main__":
    main()
    