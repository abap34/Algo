MOD = 998_244_353


def main():
    def solve(m):
        dp = [[[0] * m for _ in range(m + 1)] for _ in range(N+1)]
        dp[0][0][0] = 1  # 0個選んで余りが0は1通りです
        for i, x in enumerate(A):
            for j in range(m+1):
                for k in range(m):
                    if j + 1 <= m:
                        k2 = (k + x) % m
                        dp[i+1][j+1][k2] += dp[i][j][k]
                        dp[i+1][j+1][k2] %= MOD
                    dp[i+1][j][k] += dp[i][j][k]
                    dp[i+1][j][k] %= MOD

        return dp[N][m][0]  # m個選んで総和の余りが0

    N = int(input())
    A = list(map(int, input().split()))
    ans = 0
    for i in range(1, N + 1):
        ans += solve(i)
        ans %= MOD  # 忘れずにMODをとりましょう
    print(ans)

if __name__ == '__main__':
    main()