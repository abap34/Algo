UR = 0
DR = 1
DL = 2
UL = 3

directions = [UR, DR, DL, UL]

def debug_table(dp):
    for d in directions:
        print(f'{to_str(d)} table')
        print('c |')
        for c in range(K + 1):
            print(c, '|',end=' ')
            for i in range(N):
                print(dp[i][d][c], end=' ')
            print()


    print('=======================================')


def to_str(dir):
    if dir == UR:
        return 'UR'
    if dir == DR:
        return 'DR'
    if dir == DL:
        return 'DL'
    if dir == UL:
        return 'UL'

def same_UD(dir, s):
    if 'U' in s and dir in [UR, UL]:
        return True
    
    if 'D' in s and dir in [DR, DL]:
        return True
    
    return False

def same_LR(dir, s):
    if 'L' in s and dir in [UL, DL]:
        return True
    
    if 'R' in s and dir in [UR, DR]:
        return True
    
    return False

def flip_diff(dir, s: str):
    if same_UD(dir, s):
        return flip_LR(dir)
    
    if same_LR(dir, s):
        return flip_UD(dir)

def flip_same(dir, s: str):
    if same_UD(dir, s):
        return flip_UD(dir)
    
    if same_LR(dir, s):
        return flip_LR(dir)
    
def flip_all(dir):
    if dir == UR:
        return DL
    if dir == DR:
        return UL
    if dir == DL:
        return UR
    if dir == UL:
        return DR

def flip_LR(dir):
    if dir == UR:
        return UL
    if dir == DR:
        return DL
    if dir == DL:
        return DR
    if dir == UL:
        return UR   
    
# 上下反転
def flip_UD(dir):
    if dir == UR:
        return DR
    if dir == DR:
        return UR
    if dir == DL:
        return UL
    if dir == UL:
        return DL


def suitable_dirs(s):
    if s == 'L':
        return UL, DL
    if s == 'R':
        return UR, DR
    if s == 'U':
        return UR, UL
    if s == 'D':
        return DR, DL

N = 0
K = 0

def main():
    S = input()
    global N 
    N = len(S)
    global K 
    K = int(input())

    # dp[i][d][c] := i 文字目までで d方向を目指したとき. 魔法 c 回での best
    dp = [
        [
            [0 for _ in range(K + 1)]
            for _ in range(4)
        ]
        for _ in range(N)
    ]

    S = S[::-1]  

    suite_dirs = suitable_dirs(S[0])

    for d in directions:
        if d in suite_dirs:
            dp[0][d][0] = 1
        else:
            dp[0][d][0] = 0
            dp[0][d][1] = 1
    
    debug_table(dp)

    print("==== start ====")

    for i in range(1, N):
        s = S[i]
        suite_dirs = suitable_dirs(s)

        print(s)

        for d in directions:
            for c in range(K + 1):
                v = dp[i][d][c]
                assert v == 0
                if d in suite_dirs:
                    # 魔法なし
                    v = max(v, dp[i-1][d][c] + 1)

                    if c - 1 < 0:
                        dp[i][d][c] = v
                        continue

                    # 魔法一個だけ (一致しないほう)                   
                    v = max(v, dp[i-1][flip_diff(d, s)][c-1] + 1)

                    # 魔法一個だけ (一致するほう)
                    v = max(v, dp[i-1][flip_same(d, s)][c-1] - 1)
                    
                    # 魔法両方
                    v = max(v, dp[i-1][flip_all(d)][c-2] - 1)

                else:
                    # 魔法なし
                    v = max(v, dp[i-1][d][c] - 1)

                    if c - 1 < 0:
                        dp[i][d][c] = v
                        continue

                    # 魔法一個だけ
                    v = max(v, dp[i-1][flip_LR(d)][c-1] + 1)
                    v = max(v, dp[i-1][flip_UD(d)][c-1] + 1)

                    # 魔法両方
                    v = max(v, dp[i-1][flip_all(d)][c-2] + 1)
                
                dp[i][d][c] = v
        
        debug_table(dp)


    debug_table(dp)


    ans = -1
    for d in directions:
        for c in range(K+1):
            ans = max(ans, dp[N-1][d][c])

    print(ans)



if __name__ == "__main__":
    main()


    